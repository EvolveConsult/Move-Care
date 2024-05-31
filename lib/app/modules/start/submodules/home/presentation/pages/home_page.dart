import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intersperse/intersperse.dart';
import 'package:moveecare/app/core/ui/widgets/app_bar_widget.dart';
import 'package:moveecare/app/core/ui/widgets/app_scaffold_widget.dart';

import '../../../../../../core/app_routes.dart';
import '../../../../../../core/ui/theme/app_typography.dart';
import '../../../../../../core/ui/theme/app_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<_HomeOption> homeOptions = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Color colorButtons = Theme.of(context).colorScheme.onSecondary.withOpacity(.75);
    homeOptions = [
      // _HomeOption(
      //   onTap: () => Modular.to.pushNamed(AppRoutes.wellcome),
      //   icon: Container(
      //       height: 20,
      //       width: 20,
      //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: colorButtons),
      //       alignment: Alignment.center,
      //       child: AppText('1',
      //           textStyle: TextStyle(color: Theme.of(context).colorScheme.background), size: AppTextSize.verySmall)),
      //   label: 'Boas-vindas',
      // ),
      // _HomeOption(
      //   onTap: () => Modular.to.pushNamed(AppRoutes.guidanceForUsers),
      //   icon: Icon(size: 20, Icons.arrow_forward_ios_rounded, color: colorButtons),
      //   label: 'Orientações ao usuário',
      // ),
      // _HomeOption(
      //     onTap: () => Modular.to.pushNamed(AppRoutes.tests),
      //     icon: AppIcon(icon: AppIcons.tests, color: colorButtons),
      //     label: 'Testes'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      pagePadding: const EdgeInsets.all(0),
      leadingActionType: LeadingActionType.none,
      showAppTopPageWidget: true,
      canPop: false,
      page: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.only(top: View.of(context).viewPadding.top, bottom: 8),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(140),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: AppIcons.logo.icon(),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: AppText(
                'Olá!',
                textAlign: TextAlign.center,
                textStyle: TextStyle(fontWeight: FontWeight.w500),
                size: AppTextSize.big,
              ),
            ),
            const SliverToBoxAdapter(child: AppText('Seja bem-vindo(a) ao Move&Care', textAlign: TextAlign.center)),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Spacer(),
                  const SizedBox(height: 16),
                  ...intersperse(
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        height: 1,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      List.generate(
                          homeOptions.length,
                          (index) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: homeOptions[index],
                              ))),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _HomeOption extends StatelessWidget {
  const _HomeOption({required this.icon, required this.label, required this.onTap});
  final Widget icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppRichText(children: [WidgetSpan(child: icon), TextSpan(text: '   $label')]),
    );
  }
}
