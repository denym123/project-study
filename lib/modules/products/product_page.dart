import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:testekobe/modules/modules.dart';
import 'package:testekobe/modules/products/widgets/products_list_widget.dart';
import 'package:testekobe/shared/life_cycle/life_cycle.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState
    extends PageLifeCycleState<ProductPage, ProductsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Watch((context) {
        return controller.productsAS.value.map(
          refreshing: () => const Center(child: CircularProgressIndicator()),
          data: (data) {
            return RefreshIndicator(
              onRefresh: () async {
                await controller.refreshProducts();
              },
              child: ProductsListWidget(products: data),
            );
          },
          error: (error, stackTrace) {
            return Center(child: Text('Error: ${error.toString()}'));
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
      }),
    );
  }
}
