import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../shared/shared_navigator.dart';
import '../../authentication_navigator.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required AuthenticationNavigator navigator,
    required SharedNavigator sharedNavigator,
  })  : _navigator = navigator,
        _sharedNavigator = sharedNavigator,
        super(const LoginState());

  final AuthenticationNavigator _navigator;
  final SharedNavigator _sharedNavigator;

  void onEmailChanged(String? value) {}

  void onPasswordChanged(String? value) {}

  void onLoginTap() {
    _sharedNavigator.openMainModule();
  }

  void onSignUpTap() {
    _navigator.openRegisterPage();
  }

  void onForgotPasswordTap() {
    _navigator.openForgotPasswordPage();
  }
}
