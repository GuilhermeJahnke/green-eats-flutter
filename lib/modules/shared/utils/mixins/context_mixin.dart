import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../main/main_navigator.dart';
import '../../configs/constants/app_text_style.dart';

extension BuildContextMixin on BuildContext {
  void showSuccessAddCartSnackBar() {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          'Produto adicionado ao carrinho',
          style: AppTextStyle.bodyRegular.copyWith(
            color: Colors.white,
          ),
        ),
        action: SnackBarAction(
          label: 'Ver carrinho',
          onPressed: Modular.get<MainNavigator>().goToCart,
        ),
      ),
    );
  }
}
