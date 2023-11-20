import '../../domain/entities/order.dart';
import 'order_status_model.dart';

class OrderModel extends Order {
  OrderModel({
    required super.id,
    required super.price,
    required super.establishmentImage,
    required super.quantity,
    required super.status,
    required super.date,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'],
        price: json['price'],
        establishmentImage: json['establishmentImage'],
        quantity: json['quantity'],
        status: OrderStatusModel.fromJson(json['status']),
        date: DateTime.parse(json['updated_at']),
      );
}
