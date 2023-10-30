import 'package:flutter/material.dart';

import 'local_datasource.dart';

class LocalDatasourceImpl implements LocalDatasource {
  @override
  Future<String?> getCookie() async {
    debugPrint('Get Cookie');

    return 'Oi';
  }

  @override
  Future<void> setCookie(String cookie) async {
    debugPrint('Set Cookie');

    return;
  }
}
