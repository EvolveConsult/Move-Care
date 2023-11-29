import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movecare/app/core/app_routes.dart';
import 'package:movecare/app/core/ui/theme/app_typography.dart';
import 'package:movecare/app/core/ui/widgets/app_navigation_destination_widget.dart';
import '../../../../core/ui/theme/icons.dart';
import '../../../../core/ui/widgets/app_bar_widget.dart';
import '../../../../core/ui/widgets/app_scaffold_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  final PageController pageController = PageController();

  void onDestinationSelected(int index) {
    setState(() {
      currentPageIndex = index;
      pageController.jumpToPage(currentPageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      leadingActionType: LeadingActionType.none,
      hasAppBar: false,
      pagePadding: EdgeInsets.zero,
      page: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        pageSnapping: false,
        children: [_Home(), _Profile()],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) => states.contains(MaterialState.selected)
                ? TextStyle(color: Theme.of(context).colorScheme.onSurface)
                : TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(.3)),
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(boxShadow: <BoxShadow>[BoxShadow(color: Colors.black26, blurRadius: 2)]),
          child: NavigationBar(
            onDestinationSelected: onDestinationSelected,
            indicatorColor: Colors.transparent,
            selectedIndex: currentPageIndex,
            surfaceTintColor: Colors.white,
            height: 70,
            shadowColor: Colors.yellow,
            destinations: const <Widget>[
              AppNavigationDestinationWidget(label: 'Início', pathSvg: AppIcons.home),
              AppNavigationDestinationWidget(label: 'Perfil', pathSvg: AppIcons.profile),
            ],
          ),
        ),
      ),
    );
  }
}

class _Home extends StatefulWidget {
  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  List<_HomeOption> homeOptions = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Color colorButtons = Theme.of(context).colorScheme.onSecondary.withOpacity(.75);
    homeOptions = [
      _HomeOption(
        onTap: () => Modular.to.pushNamed(AppRoutes.wellcome),
        icon: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: colorButtons),
            alignment: Alignment.center,
            child: AppText('1',
                textStyle: TextStyle(color: Theme.of(context).colorScheme.background), size: AppTextSize.verySmall)),
        label: 'Boas-vindas',
      ),
      _HomeOption(
        onTap: () {},
        icon: Icon(size: 20, Icons.arrow_forward_ios_rounded, color: colorButtons),
        label: 'Orientações ao usuário',
      ),
      _HomeOption(
          onTap: () => Modular.to.pushNamed(AppRoutes.tests),
          icon: AppIcon(icon: AppIcons.tests, color: colorButtons),
          label: 'Testes'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: View.of(context).viewPadding.top + 24),
        Container(height: 140, width: 140, color: Theme.of(context).colorScheme.secondary),
        const SizedBox(height: 20),
        const SizedBox(
          child: Column(
            children: [
              AppText(
                'Olá!',
                textAlign: TextAlign.center,
                textStyle: TextStyle(fontWeight: FontWeight.w500),
                size: AppTextSize.big,
              ),
              AppText('Seja bem-vindo(a) ao Move & Care', textAlign: TextAlign.center),
            ],
          ),
        ),
        const Spacer(),
        const SizedBox(height: 16),
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: homeOptions[index],
              );
            },
            separatorBuilder: (_, __) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  height: 1,
                  color: Theme.of(context).colorScheme.outline,
                ),
            itemCount: homeOptions.length),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('PROFILE'));
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
