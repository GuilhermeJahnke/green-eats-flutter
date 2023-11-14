import '../entities/user.dart';

abstract class GetCurrentUsecase {
  Future<User?> getCurrentUser();
}
