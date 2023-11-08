import 'package:flutter_modular/flutter_modular.dart';

import '../shared/app_module.dart';
import 'domain/entities/nav_bar_item.dart';
import 'main_navigator.dart';
import 'presentation/atomic/organisms/wrapper_navbar_organism.dart';
import 'presentation/cubits/main_cubit.dart';
import 'submodules/home/home_module.dart';

class MainModule extends Module {
  static const routeName = '/main';
  static const routePath = AppModule.routePath + routeName;

  @override
  List<Module> get imports => [
        HomeModule(),
      ];

  @override
  List<Bind> get binds => [
        // Navigator
        Bind.lazySingleton((i) => MainNavigator()),

        // Cubits
        Bind.lazySingleton((i) => MainCubit()),

        // Navbar routes
        Bind.lazySingleton<List<NavBarItem>>((i) => [
              HomeItem(),
              CategoryItem(),
              CartItem(),
              OrderItem(),
              ProfileItem(),
            ]),
      ];

  @override
  List<ModularRoute> get routes => [
        RedirectRoute(
          MainModule.routePath,
          to: HomeModule.routePath,
        ),
        ChildRoute(
          WrapperNavbar.routeName,
          child: (context, args) => const WrapperNavbar(),
          children: [
            ModuleRoute(
              HomeModule.routeName,
              module: HomeModule(),
            ),
          ],
        ),
      ];
}
