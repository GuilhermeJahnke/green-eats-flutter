import '../../../../../shared/domain/entities/product.dart';

abstract class CartRemoteDatasource {
  Future<void> sendOrder(List<Product> products);
}
