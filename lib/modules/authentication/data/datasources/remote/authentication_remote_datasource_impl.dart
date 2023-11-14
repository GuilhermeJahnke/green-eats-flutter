import '../../../../shared/configs/data/network/app_network.dart';
import '../../../../shared/data/dio/not_logged_dio.dart';
import '../../../../shared/data/models/user_model.dart';
import '../../../../shared/domain/entities/user.dart';
import 'authentication_remote_datasource.dart';

class AuthenticationRemoteDatasourceImpl
    implements AuthenticationRemoteDatasource {
  const AuthenticationRemoteDatasourceImpl({
    required NotLoggedDio notLoggedDio,
    required AppNetwork appNetwork,
  })  : _notLoggedDio = notLoggedDio,
        _appNetwork = appNetwork;

  final NotLoggedDio _notLoggedDio;
  final AppNetwork _appNetwork;

  @override
  Future<User> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _notLoggedDio.post(
      _appNetwork.signIn,
      data: {
        'email': email,
        'password': password,
      },
    );

    final user = UserModel.fromJson(
      response.data,
    );

    return user;
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<User> signUp({
    required String name,
    required String lastName,
    required String document,
    required String email,
    required String password,
  }) async {
    final response = await _notLoggedDio.post(
      _appNetwork.signUp,
      data: {
        'firstName': name,
        'last_name': lastName,
        'document': document,
        'email': email,
        'password': password,
      },
    );

    final user = UserModel.fromJson(
      response.data,
    );

    return user;
  }
}
