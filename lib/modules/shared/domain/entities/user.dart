import '../../configs/constants/app_assets.dart';

class User {
  const User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.email,
    required this.document,
    this.photoUrl = AppAssets.defaultProfileIcon,
  });

  final String id;
  final String name;
  final String lastName;
  final String email;
  final String document;
  final String photoUrl;

  User copyWith({
    String? id,
    String? name,
    String? lastName,
    String? email,
    String? document,
    String? photoUrl,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      document: document ?? this.document,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}
