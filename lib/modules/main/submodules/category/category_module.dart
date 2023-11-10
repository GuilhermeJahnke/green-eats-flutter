import 'package:flutter_modular/flutter_modular.dart';

import '../../presentation/atomic/organisms/wrapper_navbar_organism.dart';
import 'presentation/cubits/category_cubit.dart';
import 'presentation/pages/category_page.dart';

class CategoryModule extends Module {
  static const String routeName = '/category';
  static const routePath = WrapperNavbar.routePath + routeName;

  @override
  List<Bind<Object>> get binds => [
        // Cubits
        Bind.lazySingleton(
          (i) => CategoryCubit(),
          export: true,
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        RedirectRoute(
          CategoryModule.routePath,
          to: CategoryPage.routePath,
        ),
        ChildRoute(
          CategoryPage.routeName,
          child: (context, args) => const CategoryPage(),
        ),
      ];
}
