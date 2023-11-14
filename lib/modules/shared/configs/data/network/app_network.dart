import '../../env/environment.dart';

class AppNetwork {
  const AppNetwork({
    required this.environment,
  });

  final Environment environment;

  String get baseUrl => environment.baseUrl;

  String get signIn => '$baseUrl/auth/sign-in';
}
