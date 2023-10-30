import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/cubits/splash_cubit.dart';
import 'presentation/pages/splash_page.dart';

class SplashModule extends Module {
  static const moduleName = '/splash';

  @override
  List<Bind<Object>> get binds => [
        // Cubits
        Bind(
          (i) => SplashCubit(sharedNavigator: i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, __) => const SplashPage(),
        ),
      ];
}
