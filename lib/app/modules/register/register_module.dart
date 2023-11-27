import 'package:flutter_modular/flutter_modular.dart';

import '../../core/app_routes.dart';
import 'presentation/controllers/register_controller.dart';
import 'presentation/pages/register_page.dart';

class RegisterModule extends Module {
  @override
  void binds(i) {
    i.add(RegisterController.new);
  }

  @override
  void routes(r) {
    r.child(
      AppRoutes.register,
      child: (context) => RegisterPage(controller: Modular.get()),
      transition: TransitionType.fadeIn,
    );
  }
}
