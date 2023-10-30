import 'package:dio/dio.dart';

import '../../domain/usecases/get_cookie_usecase.dart';
import '../../domain/usecases/set_cookie_usecase.dart';
import '../interceptors/logged_interceptor.dart';
import 'base_dio.dart';

class LoggedDio extends BaseDio {
  LoggedDio({
    required super.environment,
    required GetCookieUsecase getCookieUsecase,
    required SetCookieUsecase setCookieUsecase,
    List<Interceptor>? customInterceptors,
  }) : super(
          interceptors: [
            LoggedInterceptor(
              getCookieUsecase: getCookieUsecase,
              setCookieUsecase: setCookieUsecase,
            ),
            if (customInterceptors != null) ...customInterceptors,
          ],
        );
}
