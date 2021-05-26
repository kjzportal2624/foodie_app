class ApiEndpoints {
  ApiEndpoints._();

  /// Singleton - to ensure only one class instance is created
  static final ApiEndpoints _instance = ApiEndpoints._();
  factory ApiEndpoints() => _instance;

  /// API endpoints
  final Map<String, dynamic> endpoints = {
    'get_meals_by_category': 'api/json/v1/1/filter.php?c=',
    'get_meals_by_id': 'api/json/v1/1/lookup.php?i=',
  };
}
