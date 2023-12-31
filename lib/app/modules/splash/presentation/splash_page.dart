import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movecare/app/core/app_routes.dart';
import 'package:movecare/app/core/ui/theme/app_typography.dart';
import 'package:movecare/app/core/ui/widgets/app_scaffold_widget.dart';

import '../../../core/ui/widgets/app_button_widget.dart';
import '../../../core/ui/widgets/app_top_page_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      hasAppBar: false,
      pagePadding: EdgeInsets.zero,
      page: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 100),
            painter: AppTopPageWidget(),
          ),
          const SizedBox(height: 40),
          const Spacer(),
          Container(
            height: 140,
            width: 140,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const AppText(
                  'Olá!',
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(fontWeight: FontWeight.w500),
                  size: AppTextSize.big,
                ),
                const AppText(
                  'Seja bem-vindo(a)',
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(fontWeight: FontWeight.w500),
                ),
                AppText(
                  'Este é o move & care, um guia institucional ilustrado e digital que te ajudará no acompanhamento de crianças com transtornos do neurodesenvolvimento',
                  textAlign: TextAlign.center,
                  size: AppTextSize.small,
                  textStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                AppButton(
                  text: 'Criar conta',
                  onTap: () => Modular.to.pushNamed(AppRoutes.register),
                ),
                const SizedBox(height: 20),
                AppButton(
                  text: 'Entrar',
                  onTap: () => Modular.to.pushNamed(AppRoutes.auth),
                  type: AppButtonWidgetType.secondary,
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
        ],
      ),
    );
  }
}
