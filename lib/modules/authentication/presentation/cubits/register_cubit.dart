import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  void onNameChanged(String? value) {}

  void onLastNameChanged(String? value) {}

  void onCpfChanged(String? value) {}

  void onEmailChanged(String? value) {}

  void onPasswordChanged(String? value) {}

  void onConfirmPasswordChanged(String? value) {}

  void onRegisterTap() {}

  void onTermsAndConditionsTap() {}
}
