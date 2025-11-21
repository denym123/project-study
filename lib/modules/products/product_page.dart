import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:testekobe/modules/modules.dart';
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
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final product = data[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                );
              },
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
