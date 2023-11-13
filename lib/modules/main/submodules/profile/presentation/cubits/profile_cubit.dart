import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/entities/init_manager.dart';
import '../../../../../shared/domain/entities/user.dart';
import '../../../../../shared/mocks/user_mock.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> with InitManager {
  ProfileCubit() : super(const ProfileState());

  @override
  void init() {
    getUser();
  }

  void getUser() {
    emit(
      state.copyWith(
        user: userMock,
      ),
    );
  }

  void onPickImageTap() {}

  void onNameChanged(String? value) {}

  void onLastNameChanged(String? value) {}

  void onEmailChanged(String? value) {}

  void onSaveTap() {}

  void onUpdateTap() {}
}
