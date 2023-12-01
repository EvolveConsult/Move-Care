import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../core/app_routes.dart';
import 'presentation/pages/guidance_for_users_page.dart';

class GuidanceForUsersModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(AppRoutes.guidanceForUsers, child: (context) => const GuidanceForUsersPage());
  }
}
