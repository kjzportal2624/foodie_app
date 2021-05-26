import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie_app/repositories/authetication_repository.dart';
import 'package:foodie_app/services/firebase_service.dart';
import 'package:foodie_app/services/local_storage_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseService firebaseService;
  final LocalStorageService localStorageService;
  final AuthenticationRepository authenticationRepository;

  LoginBloc({
    required this.authenticationRepository,
    required this.firebaseService,
    required this.localStorageService,
  }) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginAccount) {
      yield* _mapLoginUserToState(event);
    }
  }

  Stream<LoginState> _mapLoginUserToState(LoginAccount event) async* {
    yield LoginLoading();

    try {
      /// Login user thru email and password
      final UserCredential userCredential = await authenticationRepository.login(
        email: event.email.trim(),
        password: event.password.trim(),
      );

      /// Get user
      QuerySnapshot getUserRes =
          await firebaseService.userRef.where('userId', isEqualTo: userCredential.user!.uid).limit(1).get();

      /// Get user of local storage
      print(getUserRes);
      print(getUserRes.docs.first.data());

      /// Get user of local storage
      await localStorageService.setUser(jsonEncode(getUserRes.docs.first.data()));
      await localStorageService.decodeUser();

      yield LoginSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        yield LoginError(errorMessage: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        yield LoginError(errorMessage: 'Wrong password provided for that user.');
      } else {
        print(e.code);
        yield LoginError(errorMessage: 'Something went wrong.');
      }
    } catch (e) {
      print(e);
      if (e.toString() == 'Bad state: No element') {
        yield LoginError(errorMessage: 'No user found for that email.');
      } else {
        yield LoginError(errorMessage: e.toString());
      }
    }
  }
}
