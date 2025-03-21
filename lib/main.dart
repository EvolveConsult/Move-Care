import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:moveecare/app/core/app_routes.dart';
import 'package:moveecare/firebase_options.dart';
import 'app/core/services/app_remote_config.dart';
import 'app/core/ui/theme/color_schemes.dart';
import 'app/modules/auth/auth_module.dart';
import 'app/modules/start/start_module.dart';
import 'app/modules/recovery_password/recovery_password_module.dart';
import 'app/modules/register/register_module.dart';
import 'app/modules/splash/splash_module.dart';
import 'app/modules/start/submodules/profile/submodules/contacts_us/contact_us_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  await _initializeFirebase();
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
    Modular.setInitialRoute(AppRoutes.start);
    Modular.setNavigatorKey(AppGlobalKeys.navigatorKey);
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidgetBuilder: (progress) => const Center(child: CircularProgressIndicator.adaptive()),
      child: MaterialApp.router(
        title: 'Move&Care',
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        routerConfig: Modular.routerConfig,
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: AppGlobalKeys.scaffoldMessengerKey,
        key: AppGlobalKeys.globalKey,
        supportedLocales: const [Locale('pt', 'BR')],
        locale: const Locale('pt', 'BR'),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}

class AppModule extends Module {
  @override
  List<Module> get imports => [AuthModule()];

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

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  AppRemoteConfig().initialize();
  // FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // FlutterError.onError = (errorDetails) {
  //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  // };

  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };
}
