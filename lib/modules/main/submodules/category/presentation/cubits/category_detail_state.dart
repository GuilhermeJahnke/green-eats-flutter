part of 'category_detail_cubit.dart';

class CategoryDetailState extends Equatable {
  const CategoryDetailState({
    this.products = const [],
    this.category,
  });

  final List<Product> products;
  final Category? category;

  CategoryDetailState copyWith({
    List<Product>? products,
    Category? category,
  }) {
    return CategoryDetailState(
      products: products ?? this.products,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [products, category];
}
