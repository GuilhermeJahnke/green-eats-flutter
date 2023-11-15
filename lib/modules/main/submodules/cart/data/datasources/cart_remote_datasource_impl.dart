import '../../../../../shared/configs/data/network/app_network.dart';
import '../../../../../shared/data/dio/logged_dio.dart';
import '../../../../../shared/domain/entities/product.dart';
import 'cart_remote_datasource.dart';

class CartRemoteDatasourceImpl implements CartRemoteDatasource {
  CartRemoteDatasourceImpl({
    required this.loggedDio,
    required this.appNetwork,
  });

  final LoggedDio loggedDio;
  final AppNetwork appNetwork;

  @override
  Future<void> sendOrder(List<Product> products) async {
    await loggedDio.post(
      appNetwork.sendOrder,
      data: {
        'products': products.map((product) => product.toJson()).toList(),
      },
    );

    return;
  }
}
