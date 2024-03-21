import 'package:flutter_test/flutter_test.dart';
import 'package:green_eats_flutter/modules/shared/data/exceptions/exceptions.dart';
import 'package:green_eats_flutter/modules/shared/data/models/category_model.dart';

import '../../shared_mock.dart';

void main() {
  group('When [CategoryModel] is called', () {
    test('When the json is valid, return a [Category]', () {
      final validJson = categoryValidJson;

      final categoryModel = CategoryModel.fromJson(validJson);

      expect(categoryModel, isA<CategoryModel>());
    });
    test('When the json is inValid, throw a [ParseException]', () {
      final invalidJson = categoryinvalidJson;

      CategoryModel categoryModelCall() => CategoryModel.fromJson(invalidJson);

      expect(categoryModelCall, throwsA(isA<ParseException>()));
    });
  });
}
