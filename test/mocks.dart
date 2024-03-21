import 'package:green_eats_flutter/modules/shared/configs/data/network/app_network.dart';
import 'package:green_eats_flutter/modules/shared/configs/env/environment_impl.dart';
import 'package:green_eats_flutter/modules/shared/data/dio/not_logged_dio.dart';
import 'package:green_eats_flutter/modules/shared/domain/errors/failures/failure.dart';
import 'package:green_eats_flutter/modules/shared/shared_navigator.dart';
import 'package:mocktail/mocktail.dart';

class NotLoggedDioMock extends Mock implements NotLoggedDio {}

class SharedNavigatorMock extends Mock implements SharedNavigator {}

final appNetworkMock = AppNetwork(environment: DevEnvironment());

final exceptionMock = Exception();
final failureMock = Failure(exception: exceptionMock);

const String emailValid = 'teste@gmail.com';
const String emailInvalid = 'teste';
const String passwordValid = '12345678';
const String passwordInvalid = '12345';
