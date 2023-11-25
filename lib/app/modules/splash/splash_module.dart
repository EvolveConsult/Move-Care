import 'package:flutter_modular/flutter_modular.dart';

import '../../core/app_routes.dart';

import 'presentation/splash_page.dart';

class SplashModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(AppRoutes.splash, child: (context) => const SplashPage());
  }
}
