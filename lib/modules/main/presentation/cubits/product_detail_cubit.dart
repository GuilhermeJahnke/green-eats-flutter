import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/domain/entities/product.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit({
    required this.product,
  }) : super(const ProductDetailState());

  final Product product;

  void init() {
    emit(
      state.copyWith(
        product: product,
      ),
    );
  }

  void onAddQuantityTap() {
    emit(
      state.copyWith(
        product: state.product!.copyWith(
          quantity: state.product!.quantity + 1,
        ),
      ),
    );
  }

  void onRemoveQuantityTap() {
    emit(
      state.copyWith(
        product: state.product!.copyWith(
          quantity: state.product!.quantity - 1,
        ),
      ),
    );
  }

  void onAddCartTap() {}
}
