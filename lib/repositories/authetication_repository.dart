import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie_app/services/firebase_service.dart';

class AuthenticationRepository {
  AuthenticationRepository._();

  /// Singleton - to ensure only one class instance is created
  static final AuthenticationRepository _instance = AuthenticationRepository._();
  factory AuthenticationRepository() => _instance;

  final FirebaseService firebaseServices = FirebaseService();

  Future<UserCredential> login({required String email, required String password}) async {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential;
  }

  Future<UserCredential> register({required String email, required String password}) async {
    UserCredential userCredential = await firebaseServices.authInstance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential;
  }

  Future<void> logout() async => await firebaseServices.authInstance.signOut();
}
