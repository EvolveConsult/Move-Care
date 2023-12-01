import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:movecare/app/core/app_routes.dart';
import 'app/core/ui/theme/color_schemes.dart';
import 'app/modules/auth/auth_module.dart';
import 'app/modules/start/start_module.dart';
import 'app/modules/recovery_password/recovery_password_module.dart';
import 'app/modules/register/register_module.dart';
import 'app/modules/splash/splash_module.dart';
import 'app/modules/start/submodules/profile/submodules/contacts_us/contact_us_module.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppGlobalKeys {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final globalKey = GlobalKey();
  static final navigatorKey = GlobalKey<NavigatorState>();
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Move & Care',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      routerConfig: Modular.routerConfig,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: AppGlobalKeys.scaffoldMessengerKey,
      key: AppGlobalKeys.globalKey,
    );
  }
}

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: SplashModule());
    r.module(AppRoutes.auth, module: AuthModule());
    r.module(Modular.initialRoute, module: StartModule());
    r.module(Modular.initialRoute, module: RecoveryPasswordModule());
    r.module(Modular.initialRoute, module: RegisterModule());
    r.module(Modular.initialRoute, module: ContactUsModule());
  }
}
