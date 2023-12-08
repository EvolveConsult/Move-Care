import 'package:flutter_modular/flutter_modular.dart';
import 'package:movecare/app/core/app_routes.dart';

import '../../modules/auth/presentation/controllers/auth_controller.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: AppRoutes.splash);

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    return Modular.get<AuthController>().isLogged;
  }
}
