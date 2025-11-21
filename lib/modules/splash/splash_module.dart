import 'package:provider/provider.dart';

import '../../shared/shared.dart';
import 'splash.dart';

class SplashModule extends ProviderModule {
  static final path = '/';
  SplashModule()
    : super(
        path: path,
        page: const SplashPage(),
        bindings: (state) {
          return [
            Provider(
              create: (context) {
                return SplashController();
              },
            ),
          ];
        },
      );
}
