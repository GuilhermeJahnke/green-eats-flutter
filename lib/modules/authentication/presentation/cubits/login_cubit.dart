import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../shared/domain/entities/status.dart';
import '../../../shared/domain/errors/failures/failure.dart';
import '../../../shared/shared_navigator.dart';
import '../../../shared/utils/utils.dart';
import '../../authentication_navigator.dart';
import '../../domain/usecases/sign_in_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required AuthenticationNavigator navigator,
    required SharedNavigator sharedNavigator,
    required SignInUseCase signInUseCase,
  })  : _navigator = navigator,
        _sharedNavigator = sharedNavigator,
        _signInUseCase = signInUseCase,
        super(const LoginState());

  final AuthenticationNavigator _navigator;
  final SharedNavigator _sharedNavigator;
  final SignInUseCase _signInUseCase;

  void onEmailChanged(String? value) {
    if (value == null) return;

    if (Utils.isEmailValid(value)) {
      emit(state.copyWith(email: value));
    }
  }

  void onPasswordChanged(String? value) {
    if (value?.trim() == null) return;

    if (value!.length >= 6) {
      emit(state.copyWith(password: value));
    }
  }

  Future<void> _signIn() async {
    emit(state.copyWith(status: Status.loading));

    final result = await _signInUseCase(
      email: state.email!,
      password: state.password!,
    );

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: Status.failure,
            failure: failure,
          ),
        );
      },
      (_) {
        emit(
          state.copyWith(status: Status.success),
        );
        _sharedNavigator.openMainModule();
      },
    );
  }

  void onLoginTap() {
    _signIn();
  }

  void onSignUpTap() {
    _navigator.openRegisterPage();
  }

  void onForgotPasswordTap() {
    _navigator.openForgotPasswordPage();
  }
}
