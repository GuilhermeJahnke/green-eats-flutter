part of 'orders_cubit.dart';

class OrdersState extends Equatable {
  const OrdersState({
    this.orders = const [],
  });

  final List<Order> orders;

  @override
  List<Object?> get props => [orders];

  OrdersState copyWith({
    List<Order>? orders,
  }) {
    return OrdersState(
      orders: orders ?? this.orders,
    );
  }
}
