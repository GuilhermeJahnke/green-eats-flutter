import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:green_eats_flutter/modules/authentication/data/datasources/remote/authentication_remote_datasource.dart';
import 'package:green_eats_flutter/modules/authentication/data/datasources/remote/authentication_remote_datasource_impl.dart';
import 'package:green_eats_flutter/modules/shared/data/dio/not_logged_dio.dart';
import 'package:green_eats_flutter/modules/shared/domain/entities/user.dart';

import 'package:mocktail/mocktail.dart';

import '../../../../../mocks.dart';
import '../../../authentication_mocks.dart';

void main() {
  late NotLoggedDio notLoggedDio;

  // Tested
  late AuthenticationRemoteDatasource datasource;

  setUpAll(
    () {
      notLoggedDio = NotLoggedDioMock();
      datasource = AuthenticationRemoteDatasourceImpl(
        notLoggedDio: notLoggedDio,
        appNetwork: appNetworkMock,
      );
    },
  );

  group('Quando o [AuthenticationRemoteDatasourceImpl] é chamado', () {
    group('Quando o [SignIn] for chamado', () {
      test('Quando a chamada pro dio der sucesso', () async {
        when(
          () => notLoggedDio.post(
            any(),
            data: signInBodyMock,
          ),
        ).thenAnswer(
          (_) async => Response(
            data: userJsonSuccessMock,
            requestOptions: RequestOptions(path: ''),
          ),
        );

        Future<User> datasourceCall() async => datasource.signIn(
              email: 'teste@gmail.com',
              password: '123456789',
            );

        expect(datasourceCall, returnsNormally);
      });

      test('Quando a chamada pro dio der erro', () async {
        when(
          () => notLoggedDio.post(
            any(),
            data: signInBodyMock,
          ),
        ).thenThrow(exceptionMock);

        Future<User> datasourceCall() async => datasource.signIn(
              email: 'teste@gmail.com',
              password: '123456789',
            );

        expect(datasourceCall, throwsException);
      });
    });
  });
}
