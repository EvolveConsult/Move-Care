import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intersperse/intersperse.dart';
import 'package:movecare/app/core/ui/theme/app_typography.dart';
import 'package:movecare/app/core/ui/widgets/app_scaffold_widget.dart';

import '../../../../../../core/app_routes.dart';
import '../../../../../../core/ui/theme/icons.dart';
import '../../../../../../core/ui/widgets/app_bar_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<_ProfileOption> profileOptions = [];

  bool isIOS = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    final Color colorButtons = Theme.of(context).colorScheme.onSecondary.withOpacity(.75);
    profileOptions = [
      _ProfileOption(
          onTap: () => Modular.to.pushNamed(AppRoutes.contactUs),
          icon: AppIcon(icon: AppIcons.mail, color: colorButtons),
          label: 'Fale conosco'),
      _ProfileOption(
          onTap: () => Modular.to.pushNamed(AppRoutes.tests),
          icon: AppIcon(icon: AppIcons.star, color: colorButtons),
          label: isIOS ? 'Avaliar na Apple Store' : 'Avaliar na Google Play'),
      _ProfileOption(
          onTap: () => Modular.to.pushNamed(AppRoutes.tests),
          icon: AppIcon(icon: AppIcons.terms, color: colorButtons),
          label: 'Política de privacidade e Termos de uso'),
      _ProfileOption(
          onTap: () => Modular.to.pushNamed(AppRoutes.tests),
          icon: AppIcon(icon: AppIcons.exit, color: colorButtons),
          label: 'Sair'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      backgroundColorAppBar: Theme.of(context).colorScheme.onBackground,
      pagePadding: const EdgeInsets.all(0),
      leadingActionType: LeadingActionType.none,
      showAppTopPageWidget: true,
      canPop: false,
      page: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: MediaQuery.of(context).padding.top + 16),
                    Center(child: Container(height: 140, width: 140, color: Theme.of(context).colorScheme.primary)),
                    const SizedBox(height: 12),
                    const AppText('Maria Maria', size: AppTextSize.great),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),
                  ...intersperse(
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          height: 1,
                          color: Theme.of(context).colorScheme.outline),
                      List.generate(
                          profileOptions.length,
                          (index) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: profileOptions[index],
                              ))),
                  Container(
                      padding: const EdgeInsets.only(top: 32),
                      alignment: Alignment.center,
                      child: const AppText('Versão: 0.0.1', size: AppTextSize.verySmall))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  const _ProfileOption({required this.icon, required this.label, required this.onTap});
  final Widget icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(children: [icon, const SizedBox(width: 12), Flexible(child: AppText(label, size: AppTextSize.small))]),
    );
  }
}
