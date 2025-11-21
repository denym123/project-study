import 'package:testekobe/modules/products/models/product_model.dart';

abstract interface class ProductRepository {
  Future<List<ProductModel>> fetchProducts();
}
