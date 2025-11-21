import 'package:flutter/material.dart';

import '../../../shared/shared.dart';
import '../products.dart';

class ProductsController with ProductsVariables, ControllerLifeCycle {
  final ProductRepository _productRepository;

  ProductsController({required ProductRepository productRepository})
    : _productRepository = productRepository;

  @override
  void onReady(BuildContext context) {
    super.onReady(context);
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    FutureWrapper(
      asyncSignal: productsAS,
      future: _productRepository.fetchProducts,
    ).execute();
  }
}
