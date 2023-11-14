import '../../../../shared/domain/entities/user.dart';

abstract class AuthenticationRemoteDatasource {
  Future<User> signIn({
    required String email,
    required String password,
  });
  Future<void> register(String email, String password);
  Future<void> logout();
}
