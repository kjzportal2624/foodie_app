import 'package:intl/intl.dart';

class Utils {
  Utils._();

  /// Singleton - to ensure only one class instance is created
  static final Utils _instance = Utils._();
  factory Utils() => _instance;

  ///Email regex
  RegExp emailRegex = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  String formatDate(DateTime date) => DateFormat('MMM dd, yyyy').format(date);
}
