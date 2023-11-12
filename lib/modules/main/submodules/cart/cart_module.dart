import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/domain/entities/cart_manager.dart';
import '../../presentation/atomic/organisms/wrapper_navbar_organism.dart';
import 'presentation/cubits/cart_cubit.dart';
import 'presentation/pages/cart_page.dart';

class CartModule extends Module {
  static const String routeName = '/cart';
  static const routePath = WrapperNavbar.routePath + routeName;

  @override
  List<Bind<Object>> get binds => [
        // Cubits
        Bind.singleton(
          (i) => CartCubit(
            cartManager: CartManager.instance,
            mainNavigator: i(),
          ),
          export: true,
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        RedirectRoute(
          CartModule.routePath,
          to: CartPage.routePath,
        ),
        ChildRoute(
          CartPage.routeName,
          child: (context, args) => const CartPage(),
        ),
      ];
}
