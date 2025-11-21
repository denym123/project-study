import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testekobe/app/app_router.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppRouter.globalProviders,
      child: MaterialApp.router(routerConfig: AppRouter.route),
    );
  }
}
