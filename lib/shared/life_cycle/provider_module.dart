import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

abstract class ProviderModule {
  final String _path;
  final Widget _page;
  final List<SingleChildWidget>? Function(GoRouterState state) _bindings;

  ProviderModule({
    required String path,
    required Widget page,
    List<SingleChildWidget>? Function(GoRouterState state)? bindings,
  }) : _path = path,
       _page = page,
       _bindings = bindings ?? ((_) => null);

  GoRoute get route => GoRoute(
    path: _path,
    builder: (context, state) {
      return MultiProvider(providers: _bindings(state) ?? [], child: _page);
    },
  );
}
