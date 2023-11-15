import '../../../../../shared/domain/entities/user.dart';

abstract class ProfileRemoteDatasource {
  Future<User> updateUser({
    String? name,
    String? lastName,
    String? email,
  });
}
