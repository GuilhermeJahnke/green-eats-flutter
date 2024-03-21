import 'package:flutter_test/flutter_test.dart';
import 'package:green_eats_flutter/modules/shared/data/exceptions/exceptions.dart';
import 'package:green_eats_flutter/modules/shared/data/models/user_model.dart';

import '../../authentication_mocks.dart';

void main() {
  group('When [fromJson] is called', () {
    test('with a valid json, should return a [UserModel]', () {
      final validJson = userJsonSuccessMock;

      final userModel = UserModel.fromJson(validJson);

      expect(userModel, isA<UserModel>());
    });

    test('with a invalid json, should throw a [ParseException]', () {
      final invalidJson = userJsonFailureMock;

      UserModel userModel() => UserModel.fromJson(invalidJson);

      expect(userModel, throwsA(isA<ParseException>()));
    });
  });
}
