import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  FirebaseService._();

  /* Singleton - to ensure only one class instance is created */
  static final FirebaseService _instance = FirebaseService._();
  factory FirebaseService() => _instance;

  User? currentUser;
  FirebaseAuth? auth;
  CollectionReference? users;

  Future<void> init() async {
    await Firebase.initializeApp();

    /// Set instance
    auth = FirebaseAuth.instance;
    currentUser = FirebaseAuth.instance.currentUser;

    users = FirebaseFirestore.instance.collection('users');
  }

  FirebaseAuth get authInstance => auth!;
  User get currentUserStatus => currentUser!;

  CollectionReference get userRef => users!;
}
