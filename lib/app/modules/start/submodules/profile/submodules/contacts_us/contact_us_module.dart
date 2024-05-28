import 'package:flutter_modular/flutter_modular.dart';
import 'package:moveecare/app/modules/shared/shared_module.dart';

import '../../../../../../core/app_routes.dart';
import 'presentation/controllers/contact_us_controller.dart';
import 'presentation/pages/contact_us_page.dart';

class ContactUsModule extends Module {
  @override
  List<Module> get imports => [SharedModule()];

  @override
  void binds(i) {
    i.add(ContactUsController.new);
  }

  @override
  void routes(r) {
    r.child(
      AppRoutes.contactUs,
      child: (context) => ContactUsPageState(controller: Modular.get()),
      transition: TransitionType.fadeIn,
    );
  }
}
