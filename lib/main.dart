import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'app/core/ui/theme/color_schemes.dart';
import 'app/modules/home/home_module.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Move & Care',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      routerConfig: Modular.routerConfig,
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: HomeModule());
  }
}
