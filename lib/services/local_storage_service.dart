import 'dart:convert';
import 'package:foodie_app/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  LocalStorageService._();

  /// Singleton - to ensure only one class instance is created
  static final LocalStorageService _instance = LocalStorageService._();
  factory LocalStorageService() => _instance;

  SharedPreferences? pref;
  User? user;

  Future<void> init() async => pref = await SharedPreferences.getInstance();

  /// Sets and stores the value to local storage
  Future<void> setUser(String user) async => await pref?.setString('user', user);

  /// Gets the value from local storage
  Future<String?> getUser() async => pref?.getString('user') ?? null;

  /// Decode user and parse to User mode
  Future<User?> decodeUser() async => user = User?.fromJson(jsonDecode((await getUser())!));

  /// Remove from local storage
  Future<void> remove(String key) async => pref?.remove('key');
}
