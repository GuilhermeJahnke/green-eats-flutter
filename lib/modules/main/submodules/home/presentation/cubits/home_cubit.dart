import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/domain/entities/cart_manager.dart';
import '../../../../../shared/domain/entities/category.dart';
import '../../../../../shared/domain/entities/init_manager.dart';
import '../../../../../shared/domain/entities/product.dart';
import '../../../../../shared/mocks/category_mock.dart';
import '../../../../../shared/mocks/product_mock.dart';
import '../../../../main_navigator.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with InitManager {
  HomeCubit({
    required this.mainNavigator,
    required this.cartManager,
  }) : super(const HomeState());

  final MainNavigator mainNavigator;
  final CartManager cartManager;

  @override
  void init() {
    emit(
      state.copyWith(
        categories: categoriesListMock,
        discountProducts: productsMockList.sublist(0, 3),
        products: productsMockList,
      ),
    );
  }

  void onCardTap(Product value) {
    mainNavigator.openProductDetailPage(
      product: value,
    );
  }

  void onAddTap(Product product) {
    cartManager.addProduct(product);
  }

  void onSearchChanged(String? value) {}

  void onDiscountCardTap(Product product) {
    mainNavigator.openProductDetailPage(
      product: product,
    );
  }

  void onCategoryTap(Category value) {}

  void onSeeMoreCategoryTap() {}

  void onSeeMoreProductTap() {}
}
