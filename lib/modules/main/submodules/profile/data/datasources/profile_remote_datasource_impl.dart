import '../../../../../shared/configs/data/network/app_network.dart';
import '../../../../../shared/data/dio/logged_dio.dart';
import '../../../../../shared/data/models/user_model.dart';
import '../../../../../shared/domain/entities/user.dart';
import 'profile_remote_datasource.dart';

class ProfileRemoteDatasourceImpl implements ProfileRemoteDatasource {
  ProfileRemoteDatasourceImpl({
    required this.loggedDio,
    required this.appNetwork,
  });

  final LoggedDio loggedDio;
  final AppNetwork appNetwork;

  @override
  Future<User> updateUser({
    String? name,
    String? lastName,
    String? email,
  }) async {
    final Map<String, dynamic> body = {};

    if (name != null) {
      body['name'] = name;
    }

    if (lastName != null) {
      body['last_name'] = lastName;
    }

    if (email != null) {
      body['email'] = email;
    }

    final response = await loggedDio.put(
      appNetwork.updateProfile,
      data: body,
    );

    return UserModel.fromJson(response.data);
  }
}
