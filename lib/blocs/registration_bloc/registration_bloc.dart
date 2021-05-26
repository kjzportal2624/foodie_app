import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie_app/repositories/authetication_repository.dart';
import 'package:foodie_app/services/firebase_service.dart';
import 'package:foodie_app/services/local_storage_service.dart';
// import 'package:reactive_forms/reactive_forms.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final FirebaseService firebaseService;
  final LocalStorageService localStorageService;
  final AuthenticationRepository authenticationRepository;

  RegistrationBloc({
    required this.authenticationRepository,
    required this.firebaseService,
    required this.localStorageService,
  }) : super(RegistrationInitial());

  @override
  Stream<RegistrationState> mapEventToState(
    RegistrationEvent event,
  ) async* {
    if (event is RegisterAccount) {
      yield* _mapRegisterUserToState(event);
    }
  }

  Stream<RegistrationState> _mapRegisterUserToState(RegisterAccount event) async* {
    yield RegistrationLoading();

    try {
      /// Register user thru email and password
      final UserCredential userCredential = await authenticationRepository.register(
        email: event.registrationForm['email'].toString().trim(),
        password: event.registrationForm['password'].toString().trim(),
      );

      /// Add newly registered user
      await firebaseService.userRef.doc(userCredential.user!.uid).set({
        'userId': userCredential.user!.uid,
        'name': event.registrationForm['name'].toString().trim(),
        'email': event.registrationForm['email'].toString().trim(),
        'course': event.registrationForm['course'].toString().trim(),
        'school': event.registrationForm['school'].toString().trim(),
        'createdAt': DateTime.now().toIso8601String(),
        'updatedAt': DateTime.now().toIso8601String(),
      });

      /// Get user
      QuerySnapshot getUserRes =
          await firebaseService.userRef.where('userId', isEqualTo: userCredential.user!.uid).limit(1).get();

      print(getUserRes);
      print(getUserRes.docs.first.data());

      /// Get user of local storage
      await localStorageService.setUser(jsonEncode(getUserRes.docs.first.data()));
      await localStorageService.decodeUser();

      yield RegistrationSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        yield RegistrationError(errorMessage: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        yield RegistrationError(errorMessage: 'The account already exists for that email.');
      } else {
        print(e.code);
        yield RegistrationError(errorMessage: 'Something went wrong.');
      }
    } catch (e) {
      print(e);

      if (e.toString() == 'Bad state: No element') {
        yield RegistrationError(errorMessage: 'No user found for that email.');
      } else {
        yield RegistrationError(errorMessage: e.toString());
      }
    }
  }
}
