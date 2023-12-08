import 'package:flutter_modular/flutter_modular.dart';

import '../../core/app_routes.dart';
import 'data/datasources/register_datasource.dart';
import 'data/datasources/remote/register_datasource_firebase_imp.dart';
import 'data/repositories/register_repository_imp.dart';
import 'domain/repositories/register_repository.dart';
import 'domain/usecases/create_user_usecase.dart';
import 'presentation/controllers/register_controller.dart';
import 'presentation/pages/register_page.dart';
import 'presentation/pages/register_success_page.dart';

class RegisterModule extends Module {
  @override
  void binds(i) {
    /* DATASOURCE */
    i.addSingleton<RegisterDatasource>(RegisterDatasourceFirebaseImp.new);
    /* REPOSITORY */
    i.addSingleton<RegisterRepository>(RegisterRepositoryImp.new);
    /* USECASE */
    i.addSingleton<CreateUserUsecase>(CreateUserWithEmailAndPasswordUsecase.new);
    /* CONTROLLER */
    i.add(RegisterController.new);
  }

  @override
  void routes(r) {
    r.child(
      AppRoutes.register,
      child: (context) => RegisterPage(controller: Modular.get()),
      transition: TransitionType.fadeIn,
    );
    r.child(
      AppRoutes.registerSuccess,
      child: (context) => const RegisterSuccessPage(),
      transition: TransitionType.fadeIn,
    );
  }
}
