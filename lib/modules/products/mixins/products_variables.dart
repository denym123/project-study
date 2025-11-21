import 'package:signals/signals.dart';

import '../models/models.dart';

mixin ProductsVariables {
  final productsAS = asyncSignal(AsyncData(<ProductModel>[]));
}
