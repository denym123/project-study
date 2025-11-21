import 'package:testekobe/core/core.dart';
import 'package:testekobe/modules/products/models/product_model.dart';

import '../dtos/dtos.dart';
import 'repositories.dart';

class ProductRepositoryImpl implements ProductRepository {
  final HttpAdapter _httpAdapter;

  ProductRepositoryImpl({required HttpAdapter httpAdapters})
    : _httpAdapter = httpAdapters;

  @override
  Future<List<ProductModel>> fetchProducts() async {
    final response = await _httpAdapter.get('/products');
    return List.from(
      response.data.map((e) => ProductDto.fromJson(e).toModel()),
    );
  }
}
