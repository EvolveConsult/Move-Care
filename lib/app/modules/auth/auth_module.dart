import 'package:flutter_modular/flutter_modular.dart';

import '../../core/app_routes.dart';
import 'presentation/controllers/auth_controller.dart';
import 'presentation/pages/auth_page.dart';

class AuthModule extends Module {
  @override
  void binds(i) {
    i.add(AuthController.new);
  }

  @override
  void routes(r) {
    r.child(
      AppRoutes.auth,
      child: (context) => AuthPage(controller: Modular.get()),
      transition: TransitionType.fadeIn,
    );
  }
}
