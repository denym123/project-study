import '../products.dart';

class ProductsController with ProductsVariables {
  final ProductRepository _productRepository;

  ProductsController({required ProductRepository productRepository})
    : _productRepository = productRepository;
}
