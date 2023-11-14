abstract class AuthenticationRemoteDatasource {
  Future<void> signIn({
    required String email,
    required String password,
  });
  Future<void> register(String email, String password);
  Future<void> logout();
}
