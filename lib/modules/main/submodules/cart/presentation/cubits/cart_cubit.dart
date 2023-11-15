import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/entities/cart_manager.dart';
import '../../../../../shared/domain/entities/init_manager.dart';
import '../../../../../shared/domain/entities/product.dart';
import '../../../../../shared/domain/entities/status.dart';
import '../../../../../shared/domain/errors/failures/failure.dart';
import '../../../../main_navigator.dart';
import '../../domain/usecases/send_order_usecase.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> with InitManager {
  CartCubit({
    required this.cartManager,
    required this.mainNavigator,
    required this.sendOrderUsecase,
  }) : super(const CartState());

  final CartManager cartManager;
  final MainNavigator mainNavigator;
  final SendOrderUsecase sendOrderUsecase;

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
    _sendOrder();
  }

  Future<void> _sendOrder() async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );

    final failureOrSuccess = await sendOrderUsecase(state.products);

    failureOrSuccess.fold(
      (failure) {
        emit(
          state.copyWith(
            status: Status.failure,
            failure: failure,
          ),
        );
      },
      (_) {
        emit(
          state.copyWith(
            status: Status.success,
          ),
        );
        cartManager.removeAllProducts();
      },
    );
  }

  void sendToOrders() {
    mainNavigator.goToOrders();
  }
}
