import 'package:flutter_modular/flutter_modular.dart';

import '../../presentation/atomic/organisms/wrapper_navbar_organism.dart';
import 'presentation/cubits/home_cubit.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  static const String routeName = '/home';
  static const routePath = WrapperNavbar.routePath + routeName;

  @override
  List<Bind<Object>> get binds => [
        // Cubits
        Bind.lazySingleton(
          (i) => HomeCubit(
            mainNavigator: i(),
          ),
          export: true,
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        RedirectRoute(
          HomeModule.routePath,
          to: HomePage.routePath,
        ),
        ChildRoute(
          HomePage.routeName,
          child: (context, args) => const HomePage(),
        ),
      ];
}
