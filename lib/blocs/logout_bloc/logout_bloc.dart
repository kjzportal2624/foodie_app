import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie_app/repositories/authetication_repository.dart';
import 'package:foodie_app/services/local_storage_service.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthenticationRepository authenticationRepository;
  final LocalStorageService localStorageService;

  LogoutBloc({
    required this.authenticationRepository,
    required this.localStorageService,
  }) : super(LogoutInitial());

  @override
  Stream<LogoutState> mapEventToState(
    LogoutEvent event,
  ) async* {
    if (event is LogoutAccount) {
      yield* _mapLogoutUserToState(event);
    }
  }

  Stream<LogoutState> _mapLogoutUserToState(LogoutAccount event) async* {
    yield LogoutLoading();

    try {
      await authenticationRepository.logout();
      await localStorageService.remove('user');

      yield LogoutSuccess();
    } on FirebaseAuthException catch (e) {
      print(e.code);
      yield LogoutError(errorMessage: 'Something went wrong.');
    } catch (e) {
      print(e);
      yield LogoutError(errorMessage: e.toString());
    }
  }
}
