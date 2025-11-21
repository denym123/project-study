import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:testekobe/shared/life_cycle/life_cycle.dart';

abstract class PageLifeCycleState<
  P extends StatefulWidget,
  C extends ControllerLifeCycle
>
    extends State<P> {
  late final C controller;

  Map<String, dynamic>? get params => null;

  @override
  void initState() {
    super.initState();
    controller = context.read<C>();
    controller.onInit(params);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) controller.onReady(context);
    });
  }

  @override
  void dispose() {
    controller.onDispose();
    super.dispose();
  }
}
