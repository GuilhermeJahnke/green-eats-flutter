import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../configs/env/environment.dart';

abstract class BaseDio extends DioForNative {
  BaseDio({
    List<Interceptor>? interceptors,
    required Environment environment,
  }) : super() {
    if (kDebugMode && environment.isMock) {
      interceptors?.add(
        PrettyDioLogger(
          requestBody: true,
          maxWidth: 120,
          logPrint: (obj) => debugPrint(obj as String?),
        ),
      );
    }

    options = BaseOptions(
      baseUrl: environment.baseUrl,
      connectTimeout: 60000,
      receiveTimeout: 60000,
      sendTimeout: 60000,
    );
  }
}
