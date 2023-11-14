import '../entities/user.dart';

abstract class UpdateUserUsecase {
  Future<void> updateUser(User user);
}
