import 'package:flutter_modular/flutter_modular.dart';

import '../authentication/authentication_module.dart';

class SharedNavigator {
  void openAuthenticationModule() {
    Modular.to.pushNamedAndRemoveUntil(
      AuthenticationModule.moduleName,
      (_) => false,
    );
  }
}
