import 'package:flutter_modular/flutter_modular.dart';
import '../../core/app_routes.dart';
import 'data/datasources/recovery_password_datasource.dart';
import 'data/datasources/remote/recovery_password_datasource_firebase_imp.dart';
import 'data/repositories/recovery_password_repository_imp.dart';
import 'domain/repositories/recovery_password_repository.dart';
import 'domain/usecases/recovery_with_email_usecase.dart';
import 'presentation/controllers/recovery_password_email_controller.dart';
import 'presentation/pages/recovery_password_email_page.dart';
import 'presentation/pages/recovery_password_success_page.dart';

class RecoveryPasswordModule extends Module {
  @override
  void binds(i) {
    /* DATASOURCE */
    i.addSingleton<RecoveryPasswordDatasource>(RecoveryPasswordDatasourceFirebaseImp.new);
    /* REPOSITORY */
    i.addSingleton<RecoveryPasswordRepository>(RecoveryPasswordRepositoryImp.new);
    /* USECASE */
    i.addSingleton<RecoveryWithEmailUsecase>(RecoveryWithEmailUsecaseImp.new);
    /* CONTROLLER */
    i.add(RecoveryPasswordEmailController.new);
  }

  @override
  void routes(r) {
    r.child(AppRoutes.recoveryPasswordEmail, child: (context) => RecoveryPasswordPage(controller: Modular.get()));
    r.child(AppRoutes.recoveryPasswordSuccess, child: (context) => const RecoveryPasswordSuccessPage());
  }
}
