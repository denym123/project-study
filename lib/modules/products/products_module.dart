import 'package:provider/provider.dart';
import 'package:testekobe/core/core.dart';

import '../../shared/shared.dart';
import 'products.dart';

class ProductsModule extends ProviderModule {
  static final path = '/products';
  ProductsModule()
    : super(
        path: path,
        page: const ProductsPage(),
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
