import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:signals/signals_flutter.dart';
import 'package:testekobe/shared/life_cycle/life_cycle.dart';

import 'splash.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState
    extends PageLifeCycleState<SplashPage, SplashController> {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<SplashController>();
    return Scaffold(
      body: Watch((context) {
        return controller.state.value.map(
          data: (_) => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error) => Center(child: Text('Error: ${error.toString()}')),
        );
      }),
    );
  }
}
