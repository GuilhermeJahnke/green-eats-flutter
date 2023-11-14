import '../../configs/constants/app_assets.dart';
import '../../domain/entities/user.dart';
import '../exceptions/exceptions.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.lastName,
    required super.email,
    required super.document,
    super.photoUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    try {
      return UserModel(
        id: json['id'],
        email: json['email'],
        document: json['document'],
        name: json['firstName'],
        lastName: json['lastName'],
        photoUrl: json['photoUrl'] ?? AppAssets.defaultProfileIcon,
      );
    } catch (error) {
      throw ParseException(
        message: 'Ocorreu um erro ao converter o usuário',
        data: error,
      );
    }
  }
}
