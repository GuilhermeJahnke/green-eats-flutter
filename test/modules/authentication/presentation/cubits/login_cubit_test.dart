import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:green_eats_flutter/modules/authentication/authentication_navigator.dart';
import 'package:green_eats_flutter/modules/authentication/domain/usecases/sign_in_use_case.dart';
import 'package:green_eats_flutter/modules/authentication/presentation/cubits/login_cubit.dart';
import 'package:green_eats_flutter/modules/shared/domain/entities/status.dart';
import 'package:green_eats_flutter/modules/shared/domain/usecases/update_hive_user_usecase.dart';
import 'package:green_eats_flutter/modules/shared/shared_navigator.dart';
import 'package:green_eats_flutter/modules/shared/utils/utils.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';
import '../../authentication_mocks.dart';

void main() {
  late SignInUseCase signInUseCase;
  late AuthenticationNavigator authenticationNavigator;
  late SharedNavigator sharedNavigator;
  late UpdateHiveUserUsecase updateHiveUserUsecase;

  // Testing
  late LoginCubit cubit;

  setUp(() {
    registerFallbackValue(userMock);
    signInUseCase = SignInUsecaseMock();
    authenticationNavigator = AuthenticationNavigatorMock();
    sharedNavigator = SharedNavigatorMock();
    updateHiveUserUsecase = UpdateHiveUserUsecaseMock();

    cubit = LoginCubit(
      navigator: authenticationNavigator,
      sharedNavigator: sharedNavigator,
      signInUseCase: signInUseCase,
      updateUserUsecase: updateHiveUserUsecase,
    );
  });

  group('When TextFields changed', () {
    group('When email changed', () {
      test('When email is not null and valid, save in the state', () async {
        cubit.onEmailChanged(emailValid);

        expect(cubit.state.email, isNotNull);
        expect(cubit.state.email, isNotEmpty);
        expect(cubit.state.email, emailValid);
      });

      test('When email is not valid, this not save in the state', () async {
        cubit.onEmailChanged(emailInvalid);

        expect(cubit.state.email, isNull);
        expect(Utils.isEmailValid(emailInvalid), false);
      });
    });

    group('When password changed', () {
      test('When password is valid, save in the state', () async {
        cubit.onPasswordChanged(passwordValid);

        expect(cubit.state.password, isNotNull);
        expect(cubit.state.password, isNotEmpty);
        expect(cubit.state.password, passwordValid);
      });

      test('When password is invalid, this not save in the state', () async {
        cubit.onPasswordChanged(passwordInvalid);

        expect(cubit.state.password, isNull);
        expect(passwordInvalid.length < 6, true);
      });
    });

    group('When [onLoginTap] is called', () {
      group('Should call [_signInUseCase]', () {
        setUp(() {
          when(() => signInUseCase(email: emailValid, password: passwordValid))
              .thenAnswer(
            (_) async => const Right(userMock),
          );

          when(() => updateHiveUserUsecase.updateUser(userMock))
              .thenAnswer((_) async {});
          cubit.onEmailChanged(emailValid);
          cubit.onPasswordChanged(passwordValid);
        });
        test('[Status] is loading', () async {
          cubit.onLoginTap();

          expect(cubit.state.status, Status.loading);
        });

        test('When complete usecase, [Status] is sucess', () async {
          await cubit.onLoginTap();

          expect(cubit.state.status, Status.success);
        });

        test(
            'When [signInUseCase] throw a failure, [Status] is failure and [Failure] is not null',
            () async {
          when(() => signInUseCase(email: emailValid, password: passwordValid))
              .thenAnswer((_) async => Left(failureMock));

          await cubit.onLoginTap();

          expect(cubit.state.status, Status.failure);
          expect(cubit.state.failure, isNotNull);
        });
      });
    });
  });
}
