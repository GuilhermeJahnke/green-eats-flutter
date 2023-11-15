import 'package:dartz/dartz.dart';

import '../../../../../shared/domain/entities/user.dart';
import '../../../../../shared/domain/errors/failures/failure.dart';
import '../../domain/usecases/update_user_usecase.dart';
import '../datasources/profile_remote_datasource.dart';

class ProfileRepository implements UpdateUserUsecase {
  ProfileRepository({
    required this.remoteDatasource,
  });

  final ProfileRemoteDatasource remoteDatasource;

  @override
  Future<Either<Failure, User>> updateUser({
    String? name,
    String? lastName,
    String? email,
  }) async {
    try {
      final result = await remoteDatasource.updateUser(
        name: name,
        lastName: lastName,
        email: email,
      );

      return Right(result);
    } catch (error) {
      return Left(
        Failure(
          exception: error,
        ),
      );
    }
  }
}
