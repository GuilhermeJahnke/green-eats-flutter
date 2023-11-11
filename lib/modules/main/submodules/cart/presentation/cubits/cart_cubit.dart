import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/entities/cart_manager.dart';
import '../../../../../shared/domain/entities/init_manager.dart';
import '../../../../../shared/domain/entities/product.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> with InitManager {
  CartCubit({
    required this.cartManager,
  }) : super(const CartState());

  final CartManager cartManager;

  @override
  void init() {
    cartManager.addListener(_onCartChangeListener);
  }

  void onDispose() {
    cartManager.removeListener(_onCartChangeListener);
  }

  void _onCartChangeListener() {
    emit(
      state.copyWith(
        products: [...cartManager.products],
      ),
    );
  }

  void onRemoveQuantityTap(Product product) {
    cartManager.removeProduct(product);
  }

  void onAddQuantityTap(Product product) {
    cartManager.addProduct(product);
  }

  void onConfirmTap() {}
}

// TODO LIST
// [ ] - initialize cubit in home
// [ ] - ver pq quando eu adiciono um produto com 10 de quantidade ele vem com 1
// [ ] - ver pq da dando erro quando vai da home pra categoria
// [ ] - integrar a navegacao do clique das categorias
// [ ] - adicionar uma animação de clique nos botões em geral
// [ ] - unificar quando o mesmo produto for adicionado novamente, para adicionar somente a quantidade escolhida a mais
