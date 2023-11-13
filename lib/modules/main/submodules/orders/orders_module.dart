import 'package:flutter_modular/flutter_modular.dart';

import '../../presentation/atomic/organisms/wrapper_navbar_organism.dart';
import 'presentation/cubits/orders_cubit.dart';
import 'presentation/pages/orders_page.dart';

class OrdersModule extends Module {
  static const String routeName = '/orders';
  static const routePath = WrapperNavbar.routePath + routeName;

  @override
  List<Bind<Object>> get binds => [
        // Cubits
        Bind((i) => OrdersCubit()),
      ];

  @override
  List<ModularRoute> get routes => [
        RedirectRoute(
          OrdersModule.routePath,
          to: OrdersPage.routePath,
        ),
        ChildRoute(
          OrdersPage.routeName,
          child: (context, args) => const OrdersPage(),
        ),
      ];
}
