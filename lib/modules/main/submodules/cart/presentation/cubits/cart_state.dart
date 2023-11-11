part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({
    this.products = const [],
  });

  final List<Product> products;

  CartState copyWith({
    List<Product>? products,
  }) {
    return CartState(
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [products];
}
