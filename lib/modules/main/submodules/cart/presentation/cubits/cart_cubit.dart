import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/entities/cart_manager.dart';
import '../../../../../shared/domain/entities/init_manager.dart';
import '../../../../../shared/domain/entities/product.dart';
import '../../../../main_navigator.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> with InitManager {
  CartCubit({
    required this.cartManager,
    required this.mainNavigator,
  }) : super(const CartState());

  final CartManager cartManager;
  final MainNavigator mainNavigator;

  @override
  void init() {
    cartManager.addListener(_onCartChangeListener);
  }

  void _onCartChangeListener() {
    emit(
      state.copyWith(
        products: [...cartManager.products],
      ),
    );
  }

  void onRemoveQuantityTap(Product product) {
    cartManager.onRemoveQuantityTap(product);
  }

  void onAddQuantityTap(Product product) {
    cartManager.onAddQuantityTap(product);
  }

  void onConfirmTap() {
    cartManager.removeAllProducts();
    mainNavigator.goToHome();
  }
}
