import 'package:flutter_modular/flutter_modular.dart';
import '../../core/app_routes.dart';
import '../../core/functions/guards.dart';
import 'presentation/pages/start_page.dart';
import 'submodules/home/submodules/wellcome_page.dart';
import 'submodules/home/submodules/guidanceForUsers/guidance_for_users_module.dart';
import 'submodules/home/submodules/tests/tests_module.dart';
import 'submodules/profile/presentation/controllers/profile_controller.dart';

class StartModule extends Module {
  @override
  void binds(i) {
    /* DATASOURCE */
    /* REPOSITORY */
    /* USECASE */
    /* CONTROLLER */
    i.add(ProfileController.new);
  }

  @override
  void routes(r) {
    r.child(AppRoutes.start, child: (context) => const StartPage(), guards: [AuthGuard()]);
    r.child(AppRoutes.wellcome, child: (context) => const WellcomePage());
    r.module(Modular.initialRoute, module: TestsModule());
    r.module(Modular.initialRoute, module: GuidanceForUsersModule());
  }
}
