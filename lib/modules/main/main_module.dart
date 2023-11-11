import 'package:flutter_modular/flutter_modular.dart';

import '../shared/app_module.dart';
import '../shared/domain/entities/cart_manager.dart';
import 'domain/entities/nav_bar_item.dart';
import 'main_navigator.dart';
import 'presentation/atomic/organisms/wrapper_navbar_organism.dart';
import 'presentation/cubits/product_detail_cubit.dart';
import 'presentation/pages/product_detail_page.dart';
import 'submodules/cart/cart_module.dart';
import 'submodules/category/category_module.dart';
import 'submodules/home/home_module.dart';

class MainModule extends Module {
  static const routeName = '/main';
  static const routePath = AppModule.routePath + routeName;

  @override
  List<Module> get imports => [
        HomeModule(),
        CategoryModule(),
        CartModule(),
      ];

  @override
  List<Bind> get binds => [
        // Navigator
        Bind.lazySingleton((i) => MainNavigator()),

        // Cubits
        Bind.factory(
          (i) => ProductDetailCubit(
            product: i.args.data,
            cartManager: CartManager.instance,
          ),
        ),

        // Navbar routes
        Bind.lazySingleton<List<NavBarItem>>(
          (i) => [
            HomeItem(),
            CategoryItem(),
            CartItem(),
            OrderItem(),
            ProfileItem(),
          ],
        ),
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
              transition: TransitionType.noTransition,
            ),
            ModuleRoute(
              CategoryModule.routeName,
              module: CategoryModule(),
              transition: TransitionType.noTransition,
            ),
            ModuleRoute(
              CartModule.routeName,
              module: CartModule(),
              transition: TransitionType.noTransition,
            ),
          ],
        ),
        ChildRoute(
          ProductDetailPage.routeName,
          child: (_, args) => const ProductDetailPage(),
        ),
      ];
}
