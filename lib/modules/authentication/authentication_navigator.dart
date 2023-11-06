import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/forgot_password_page.dart';
import 'presentation/pages/register_page.dart';

class AuthenticationNavigator {
  void openRegisterPage() {
    Modular.to.pushNamed(
      RegisterPage.routePath,
    );
  }

  void openForgotPasswordPage() {
    Modular.to.pushNamed(
      ForgotPasswordPage.routePath,
    );
  }
}
