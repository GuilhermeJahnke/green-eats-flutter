import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/configs/constants/app_assets.dart';
import '../../main_navigator.dart';
import '../../presentation/cubits/main_cubit.dart';
import '../../submodules/home/presentation/pages/home_page.dart';

sealed class NavBarItem {
  const NavBarItem({
    required this.svgPath,
    required this.route,
    required this.navigation,
    this.badgeCounter,
  });

  final String svgPath;
  final String route;
  final void Function() navigation;
  final int? badgeCounter;
}

class HomeItem extends NavBarItem {
  HomeItem()
      : super(
          svgPath: AppAssets.icHome,
          route: HomePage.routePath,
          navigation: Modular.get<MainNavigator>().goToHome,
          badgeCounter: null,
        );
}

class CategoryItem extends NavBarItem {
  CategoryItem()
      : super(
          svgPath: AppAssets.icCategory,
          route: 'CategoryPage.routePath',
          navigation: Modular.get<MainNavigator>().goToHome,
          badgeCounter: null,
        );
}

class CartItem extends NavBarItem {
  CartItem()
      : super(
          svgPath: AppAssets.icCart,
          route: 'CartPage.routePath',
          navigation: Modular.get<MainNavigator>().goToHome,
          badgeCounter: Modular.get<MainCubit>().state.cartCount,
        );
}

class OrderItem extends NavBarItem {
  OrderItem()
      : super(
          svgPath: AppAssets.icOrder,
          route: 'OrderPage.routePath',
          navigation: Modular.get<MainNavigator>().goToHome,
          badgeCounter: null,
        );
}

class ProfileItem extends NavBarItem {
  ProfileItem()
      : super(
          svgPath: AppAssets.icPerson,
          route: 'ProfilePage.routePath',
          navigation: Modular.get<MainNavigator>().goToHome,
          badgeCounter: null,
        );
}
