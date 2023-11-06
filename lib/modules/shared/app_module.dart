import 'package:flutter_modular/flutter_modular.dart';

import '../authentication/authentication_module.dart';
import '../splash/splash_module.dart';
import 'configs/data/network/app_network_impl.dart';
import 'configs/env/environment.dart';
import 'data/datasources/local_datasource/local_datasource_impl.dart';
import 'data/dio/logged_dio.dart';
import 'data/dio/not_logged_dio.dart';
import 'data/repository/shared_repository.dart';
import 'shared_navigator.dart';

class AppModule extends Module {
  AppModule(this.environment);

  final Environment environment;

  @override
  List<Bind<Object>> get binds => [
        Bind((i) => environment),
        Bind(
          (i) => AppNetworkImpl(environment: environment),
        ),
        Bind(
          (i) => LocalDatasourceImpl(),
        ),
        Bind(
          (i) => SharedRepository(
            localDatasource: i(),
          ),
        ),
        Bind(
          (i) => LoggedDio(
            environment: i(),
            getCookieUsecase: i(),
            setCookieUsecase: i(),
          ),
        ),
        Bind(
          (i) => NotLoggedDio(
            environment: i(),
            setCookieUsecase: i(),
          ),
        ),
        Bind(
          (i) => SharedNavigator(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Modular.initialRoute,
          module: SplashModule(),
        ),
        ModuleRoute(
          AuthenticationModule.moduleName,
          module: AuthenticationModule(),
        ),
      ];
}
