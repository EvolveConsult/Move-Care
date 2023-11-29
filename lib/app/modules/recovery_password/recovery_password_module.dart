import 'package:flutter_modular/flutter_modular.dart';

import '../../core/app_routes.dart';

import 'presentation/controllers/recovery_password_email_controller.dart';
import 'presentation/controllers/recovery_password_password_controller.dart';
import 'presentation/controllers/recovery_password_token_controller.dart';
import 'presentation/pages/recovery_password_email_page.dart';
import 'presentation/pages/recovery_password_password_page.dart';
import 'presentation/pages/recovery_password_success_page.dart';
import 'presentation/pages/recovery_password_token_page.dart';

class RecoveryPasswordModule extends Module {
  @override
  void binds(i) {
    i.add(RecoveryPasswordEmailController.new);
    i.add(RecoveryPasswordTokenController.new);
    i.add(RecoveryPasswordPasswordController.new);
  }

  @override
  void routes(r) {
    r.child(AppRoutes.recoveryPasswordEmail, child: (context) => RecoveryPasswordPage(controller: Modular.get()));
    r.child(AppRoutes.recoveryPasswordToken, child: (context) => RecoveryPasswordTokenPage(controller: Modular.get()));
    r.child(AppRoutes.recoveryPasswordPassword,
        child: (context) => RecoveryPasswordPasswordPage(controller: Modular.get()));
    r.child(AppRoutes.recoveryPasswordSuccess,
        child: (context) => RecoveryPasswordSuccessPage(controller: Modular.get()));
  }
}
