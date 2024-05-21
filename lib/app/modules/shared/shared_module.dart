import 'package:flutter_modular/flutter_modular.dart';

import '../../core/services/app_remote_config.dart';
import 'domain/usecases/login_with_google_usecase.dart';
import 'data/datasources/shared_datasource.dart';
import 'data/datasources/remote/shared_datasource_firebase_imp.dart';
import 'data/repositories/shared_repository_imp.dart';
import 'domain/repositories/shared_repository.dart';

class SharedModule extends Module {
  @override
  void exportedBinds(i) {
    i.addSingleton<RemoteConfigAbstract>(AppRemoteConfig.new);
    /* DATASOURCE */
    i.addSingleton<SharedDatasource>(SharedDatasourceFirebaseImp.new);
    /* REPOSITORY */
    i.addSingleton<SharedRepository>(SharedRepositoryImp.new);
    /* USECASE */
    i.addSingleton<LoginWithGoogleUsecase>(LoginWithGoogleUsecaseImp.new);
    /* CONTROLLER */
  }

  @override
  void routes(r) {}
}
