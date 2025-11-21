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
      await Future.delayed(const Duration(seconds: 2)); // Simula tempo de rede
      context.go(ProductModule.path); // Nunca chega aqui
    } catch (e, s) {
      print("✅ CAIU NO CATCH: $e");
      state.value = AsyncError(e, s);
    }
  }
}
