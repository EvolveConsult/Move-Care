import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:moveecare/app/core/app_routes.dart';
import 'package:moveecare/app/core/ui/theme/app_icons.dart';
import 'package:moveecare/app/core/ui/theme/app_typography.dart';
import 'package:moveecare/app/core/ui/theme/images.dart';
import 'package:moveecare/app/core/ui/widgets/app_scaffold_widget.dart';

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
      page: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: CustomPaint(
                size: Size(MediaQuery.of(context).size.width, 100),
                painter: AppTopPageWidget(),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
            SliverToBoxAdapter(
              child: Center(
                child: Container(
                  // alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(140),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: AppIcons.logo.icon(),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: Padding(
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
                      'Este é o Move&Care, um guia institucional ilustrado e digital que te ajudará no acompanhamento de crianças com transtornos do neurodesenvolvimento.',
                      textAlign: TextAlign.center,
                      size: AppTextSize.small,
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
            SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const Spacer(),
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
                      const SizedBox(height: 20),
                      Container(
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black.withOpacity(.2)),
                        ),
                        child: Wrap(
                          spacing: 12,
                          runSpacing: 20,
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Column(
                              children: [
                                AppText(
                                  'Idealizador:',
                                  size: AppTextSize.verySmall,
                                  textStyle: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                AppText('Prof. Dr.', size: AppTextSize.verySmall),
                                AppText('Jorge Lopes Cavalcante Neto', size: AppTextSize.verySmall),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const AppText(
                                  'Financiamento:',
                                  size: AppTextSize.verySmall,
                                  textStyle: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  alignment: WrapAlignment.center,
                                  children: [
                                    AppImages.uneb2.image(width: 80, fit: BoxFit.cover),
                                    const SizedBox(width: 8),
                                    AppImages.proinovacao2.image(width: 80, fit: BoxFit.cover),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).viewInsets.bottom + 20),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
