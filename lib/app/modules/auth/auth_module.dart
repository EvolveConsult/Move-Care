import 'package:flutter_modular/flutter_modular.dart';
import 'package:movecare/app/modules/shared/shared_module.dart';
import 'data/datasources/auth_datasource.dart';
import 'data/datasources/remote/auth_datasource_firebase_imp.dart';
import 'data/repositories/auth_repository_imp.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/check_authorization_usecase.dart';
import 'domain/usecases/login_with_email_and_password_usecase.dart';

import 'presentation/controllers/auth_controller.dart';
import 'presentation/pages/auth_page.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [SharedModule()];

  @override
  void binds(i) {
    /* DATASOURCE */
    i.addSingleton<AuthDatasource>(AuthDatasourceFirebaseImp.new);
    /* REPOSITORY */
    i.addSingleton<AuthRepository>(AuthRepositoryImp.new);
    /* USECASE */
    i.addSingleton<LoginWithEmailAndPasswordUsecase>(LoginWithEmailAndPasswordUsecaseImp.new);
    i.addSingleton<CheckAuthorizationUsecase>(CheckAuthorizationUsecaseImp.new);
    /* CONTROLLER */
    i.add(AuthController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => AuthPage(controller: Modular.get()),
      transition: TransitionType.fadeIn,
    );
  }
}
