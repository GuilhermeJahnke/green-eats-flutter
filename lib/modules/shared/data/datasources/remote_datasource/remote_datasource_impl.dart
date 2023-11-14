// ignore_for_file: unnecessary_lambdas

import '../../../configs/data/network/app_network.dart';
import '../../../domain/entities/category.dart';
import '../../../domain/entities/product.dart';
import '../../dio/logged_dio.dart';
import '../../models/category_model.dart';
import '../../models/product_model.dart';
import 'remote_datasource.dart';

class SharedRemoteDatasourceImpl implements SharedRemoteDatasource {
  SharedRemoteDatasourceImpl({
    required this.loggedDio,
    required this.appNetwork,
  });

  final LoggedDio loggedDio;
  final AppNetwork appNetwork;

  @override
  Future<List<Product>> getDiscountProducts() async {
    final response = await loggedDio.get(
      appNetwork.getDiscountProducts,
    );

    final List<Product> products = (response.data as List)
        .map((product) => ProductModel.fromJson(product))
        .toList();

    return products;
  }

  @override
  Future<List<Category>> getCategories() async {
    final response = await loggedDio.get(
      appNetwork.getCategories,
    );

    final List<Category> categories = (response.data as List)
        .map((category) => CategoryModel.fromJson(category))
        .toList();

    return categories;
  }

  @override
  Future<List<Product>> getProducts() async {
    final response = await loggedDio.get(
      appNetwork.getProducts,
    );

    final List<Product> products = (response.data as List)
        .map((product) => ProductModel.fromJson(product))
        .toList();

    return products;
  }
}
