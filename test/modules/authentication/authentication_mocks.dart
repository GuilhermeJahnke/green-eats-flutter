import 'package:green_eats_flutter/modules/authentication/authentication_navigator.dart';
import 'package:green_eats_flutter/modules/authentication/domain/usecases/sign_in_use_case.dart';
import 'package:green_eats_flutter/modules/shared/data/models/user_model.dart';
import 'package:green_eats_flutter/modules/shared/domain/usecases/update_hive_user_usecase.dart';
import 'package:mocktail/mocktail.dart';

class SignInUsecaseMock extends Mock implements SignInUseCase {}

class UpdateHiveUserUsecaseMock extends Mock implements UpdateHiveUserUsecase {}

class AuthenticationNavigatorMock extends Mock
    implements AuthenticationNavigator {}

final Map<String, dynamic> signInBodyMock = {
  'email': 'teste@gmail.com',
  'password': '123456789',
};

final Map<String, dynamic> userJsonSuccessMock = {
  'id': '32123',
  'email': 'teste@gmail.com',
  'document': '12345678909',
  'name': 'Teste',
  'photoUrl': 'https://',
};
final Map<String, dynamic> userJsonFailureMock = {
  'id': 32123,
  'email': 'teste@gmail.com',
  'document': 12345678909,
  'name': 'Teste',
  'photoUrl': 'https://',
};

const userMock = UserModel(
  id: '32123',
  email: 'teste@gmail.com',
  document: '12345678909',
  name: 'Teste',
  photoUrl: 'https://',
);
