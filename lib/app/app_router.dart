import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:testekobe/core/network/adapters/http_adapters.dart';
import 'package:testekobe/modules/products/product_module.dart';
import 'package:testekobe/modules/splash/splash_module.dart';

class AppRouter {
  static final route = GoRouter(
    initialLocation: SplashModule.path,
    routes: [ProductModule().route, SplashModule().route],
  );

  static final globalProviders = <SingleChildWidget>[
    Provider(create: (context) => HttpAdapter()),
  ];
}
