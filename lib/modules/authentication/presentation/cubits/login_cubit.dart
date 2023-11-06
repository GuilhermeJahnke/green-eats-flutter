import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../authentication_navigator.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required AuthenticationNavigator navigator,
  })  : _navigator = navigator,
        super(const LoginState());

  final AuthenticationNavigator _navigator;

  void onEmailChanged(String? value) {}

  void onPasswordChanged(String? value) {}

  void onLoginTap() {}

  void onSignUpTap() {
    _navigator.openRegisterPage();
  }

  void onForgotPasswordTap() {
    _navigator.openForgotPasswordPage();
  }
}
