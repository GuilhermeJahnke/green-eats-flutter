import 'package:dartz/dartz.dart';

import '../../../shared/domain/errors/failures/failure.dart';
import '../../domain/usecases/sign_in_use_case.dart';
import '../datasources/remote/authentication_remote_datasource.dart';

class AuthenticationRepository implements SignInUseCase {
  AuthenticationRepository({
    required this.authenticationRemoteDatasource,
  });

  final AuthenticationRemoteDatasource authenticationRemoteDatasource;

  @override
  Future<Either<Failure, void>> call({
    required String email,
    required String password,
  }) async {
    try {
      await authenticationRemoteDatasource.signIn(
        email: email,
        password: password,
      );

      return const Right(null);
    } catch (error) {
      return Left(
        Failure(exception: error),
      );
    }
  }
}
