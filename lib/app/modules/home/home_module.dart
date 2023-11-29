import 'package:flutter_modular/flutter_modular.dart';

import '../../core/app_routes.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/pages/wellcome_page.dart';
import 'submodules/guidanceForUsers/guidance_for_users_module.dart';
import 'submodules/tests/tests_module.dart';

class HomeModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(AppRoutes.home, child: (context) => const HomePage());
    r.child(AppRoutes.wellcome, child: (context) => const WellcomePage());
    r.module(Modular.initialRoute, module: TestsModule());
    r.module(Modular.initialRoute, module: GuidanceForUsersModule());
  }
}
