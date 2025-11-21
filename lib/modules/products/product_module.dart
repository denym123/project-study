import 'package:provider/provider.dart';
import 'package:testekobe/core/core.dart';

import '../../shared/shared.dart';
import 'products.dart';

class ProductModule extends ProviderModule {
  static final path = '/products';
  ProductModule()
    : super(
        path: path,
        page: const ProductPage(),
        bindings: (state) {
          return [
            Provider(
              create: (context) {
                return ProductsController(
                  productRepository: ProductRepositoryImpl(
                    httpAdapters: context.read<HttpAdapter>(),
                  ),
                );
              },
            ),
          ];
        },
      );
}
