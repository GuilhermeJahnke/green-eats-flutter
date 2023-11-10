import 'package:flutter_modular/flutter_modular.dart';

import 'submodules/category/category_module.dart';
import 'submodules/home/home_module.dart';

class MainNavigator {
  void goToHome() {
    Modular.to.navigate(
      HomeModule.routePath,
    );
  }

  void goToCategory() {
    Modular.to.navigate(
      CategoryModule.routePath,
    );
  }
}
