import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/entities/cart_manager.dart';
import '../../../../../shared/domain/entities/category.dart';
import '../../../../../shared/domain/entities/product.dart';
import '../../../../../shared/mocks/product_mock.dart';
import '../../../../main_navigator.dart';

part 'category_detail_state.dart';

class CategoryDetailCubit extends Cubit<CategoryDetailState> {
  CategoryDetailCubit({
    required this.category,
    required this.mainNavigator,
    required this.cartManager,
  }) : super(
          const CategoryDetailState(),
        );

  final Category category;
  final MainNavigator mainNavigator;
  final CartManager cartManager;

  void onInit() {
    emit(
      state.copyWith(
        category: category,
      ),
    );
    _getProducts();
  }

  Future<void> _getProducts() async {
    emit(
      state.copyWith(
        products: productsMockList,
      ),
    );
  }

  void onCardTap(Product value) {
    mainNavigator.openProductDetailPage(
      product: value,
    );
  }

  void onAddTap(Product value) {
    cartManager.addProduct(value);
  }
}
