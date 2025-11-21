import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals.dart';

import '../../../shared/shared.dart';
import '../../products/products.dart';
import '../splash.dart';

class SplashController with SplashVariables, ControllerLifeCycle {
  @override
  onReady(context) {
    _init(context);
  }

  Future<void> _init(BuildContext context) async {
    try {
      state.value = AsyncLoading();
      await Future.delayed(const Duration(seconds: 2));
      context.go(ProductsModule.path);
    } catch (e, s) {
      state.value = AsyncError(e, s);
    }
  }
}
