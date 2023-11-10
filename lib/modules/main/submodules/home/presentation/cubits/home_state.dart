part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.categories = const [],
    this.products = const [],
    this.discountProducts = const [],
  });

  final List<Category> categories;
  final List<Product> products;
  final List<Product> discountProducts;

  @override
  List<Object?> get props => [
        categories,
        products,
        discountProducts,
      ];

  HomeState copyWith({
    List<Category>? categories,
    List<Product>? products,
    List<Product>? discountProducts,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      products: products ?? this.products,
      discountProducts: discountProducts ?? this.discountProducts,
    );
  }
}
