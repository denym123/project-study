import 'package:flutter/material.dart';
import 'package:testekobe/modules/products/models/product_model.dart';

class ProductsListWidget extends StatelessWidget {
  final List<ProductModel> products;

  const ProductsListWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text(product.title),
          subtitle: Text(
            '\$${product.price}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        );
      },
    );
  }
}
