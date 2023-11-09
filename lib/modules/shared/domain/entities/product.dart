import 'header_card_helper.dart';

class Product extends HeaderCardHelper {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.discount,
    required this.imagePath,
  });

  final String id;
  final String title;
  final double price;
  final int discount;

  @override
  final String imagePath;
}
