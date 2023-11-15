part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({
    this.products = const [],
    this.status = Status.initial,
    this.failure,
  });

  final List<Product> products;
  final Status status;
  final Failure? failure;

  @override
  List<Object?> get props => [
        products,
        status,
        failure,
      ];

  CartState copyWith({
    List<Product>? products,
    Status? status,
    Failure? failure,
  }) {
    return CartState(
      products: products ?? this.products,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
