import 'package:flutter/material.dart';
import 'package:signals/signals.dart';
import 'package:testekobe/shared/life_cycle/life_cycle.dart';

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
    try {
      productsAS.value = AsyncLoading();
      final products = await _productRepository.fetchProducts();
      productsAS.value = AsyncData(products);
    } catch (e, s) {
      productsAS.value = AsyncError(e, s);
    }
  }
}
