part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.user,
    this.status = Status.initial,
    this.failure,
    this.name,
    this.lastName,
    this.email,
  });

  final Status status;
  final Failure? failure;
  final User? user;

  final String? name;
  final String? lastName;
  final String? email;

  bool get isButtonEnabled =>
      (name?.trim() != null && name?.trim() != user?.name) ||
      (lastName?.trim() != null && lastName?.trim() != user?.lastName) ||
      (email?.trim() != null && email?.trim() != user?.email);

  @override
  List<Object?> get props => [
        user,
        status,
        failure,
        name,
        lastName,
        email,
      ];

  ProfileState copyWith({
    User? user,
    Status? status,
    Failure? failure,
    String? name,
    String? lastName,
    String? email,
  }) {
    return ProfileState(
      user: user ?? this.user,
      status: status ?? this.status,
      failure: failure ?? this.failure,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
    );
  }
}
