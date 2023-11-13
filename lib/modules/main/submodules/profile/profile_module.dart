import 'package:flutter_modular/flutter_modular.dart';

import '../../presentation/atomic/organisms/wrapper_navbar_organism.dart';
import 'presentation/cubits/profile_cubit.dart';
import 'presentation/pages/profile_page.dart';

class ProfileModule extends Module {
  static const String routeName = '/profile';
  static const routePath = WrapperNavbar.routePath + routeName;

  @override
  List<Bind<Object>> get binds => [
        // Cubits
        Bind.lazySingleton(
          (i) => ProfileCubit(),
          export: true,
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        RedirectRoute(
          ProfileModule.routePath,
          to: ProfilePage.routePath,
        ),
        ChildRoute(
          ProfilePage.routeName,
          child: (context, args) => const ProfilePage(),
        ),
      ];
}
