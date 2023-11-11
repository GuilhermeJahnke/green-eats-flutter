import 'package:flutter/material.dart';

import 'product.dart';

class CartManager extends ChangeNotifier {
  CartManager._();

  static final CartManager instance = CartManager._();

  final List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    _products.remove(product);
    notifyListeners();
  }

  void onRemoveQuantityTap(Product product) {
    final index = _products.indexOf(product);

    if (product.quantity == 1) {
      removeProduct(product);
      return;
    }

    _products[index] = product.copyWith(quantity: product.quantity - 1);
    notifyListeners();
  }

  void onAddQuantityTap(Product product) {
    final index = _products.indexOf(product);
    _products[index] = product.copyWith(quantity: product.quantity + 1);
    notifyListeners();
  }
}
