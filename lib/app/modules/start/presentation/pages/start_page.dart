import 'package:flutter/material.dart';

import '../../../../core/ui/theme/app_icons.dart';
import '../../../../core/ui/widgets/app_bar_widget.dart';
import '../../../../core/ui/widgets/app_navigation_destination_widget.dart';
import '../../../../core/ui/widgets/app_scaffold_widget.dart';
import '../../submodules/home/presentation/pages/home_page.dart';
import '../../submodules/profile/presentation/pages/profile_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
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
        children: const [HomePage(), ProfilePage()],
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
