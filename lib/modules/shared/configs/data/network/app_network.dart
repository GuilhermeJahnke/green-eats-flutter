import '../../env/environment.dart';

class AppNetwork {
  const AppNetwork({
    required this.environment,
  });

  final Environment environment;

  String get baseUrl => environment.baseUrl;

  String get signIn => '$baseUrl/auth/sign-in';
  String get signUp => '$baseUrl/auth/sign-up';
  String get signOut => '$baseUrl/auth/sign-out';
  String get getCategories => '$baseUrl/category/getAll';
  String get getProducts => '$baseUrl/products/getAll';
  String get getDiscountProducts => '$baseUrl/products/getAllDiscount';
  String get updateProfile => '$baseUrl/profile/update';
  String get getAllByCategory => '$baseUrl/products/getAllByCategory';
}
