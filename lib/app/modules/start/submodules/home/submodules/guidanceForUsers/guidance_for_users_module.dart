import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../core/app_routes.dart';
import 'data/datasources/guidance_for_users_datasource.dart';
import 'data/datasources/remote/guidance_for_users_datasource_firebase_imp.dart';
import 'data/repositories/guidance_for_user_repository_imp.dart';
import 'domain/repositories/guidance_for_user_repository.dart';
import 'domain/usecases/fetch_all_guidance_for_user_usecase.dart';
import 'presentation/controllers/guidance_for_users_controller.dart';
import 'presentation/pages/guidance_for_user_details_page.dart';
import 'presentation/pages/guidance_for_users_page.dart';

class GuidanceForUsersModule extends Module {
  @override
  void binds(i) {
    /* DATASOURCE */
    i.addSingleton<GuidanceForUsersDatasource>(GuidanceForUsersDatasourceFirebaseImp.new);
    /* REPOSITORY */
    i.addSingleton<GuidanceForUserRepository>(GuidanceForUserRepositoryImp.new);
    /* USECASE */
    i.addSingleton<FetchAllGuidanceForUserUsecase>(FetchAllGuidanceForUserUsecaseImp.new);
    /* CONTROLLER */
    i.add(GuidanceForUsersController.new);
  }

  @override
  void routes(r) {
    r.child(
      AppRoutes.guidanceForUsers,
      child: (context) => GuidanceForUsersPage(controller: Modular.get<GuidanceForUsersController>()),
    );
    r.child(
      AppRoutes.guidanceForUsersDetails,
      child: (context) => GuidanceForUserDetailsPage(guidanceForUsersEntity: r.args.data),
    );
  }
}
