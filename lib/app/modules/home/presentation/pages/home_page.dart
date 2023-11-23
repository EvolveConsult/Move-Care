import 'package:flutter/material.dart';
import '../../../../core/ui/widgets/app_bar_widget.dart';
import '../../../../core/ui/widgets/app_scaffold_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      leadingActionType: LeadingActionType.none,
      hasAppBar: false,
      pagePadding: EdgeInsets.zero,
      page: ListView.builder(
        itemCount: 50,
        itemBuilder: (_, index) => Text('ITEM $index'),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[BoxShadow(color: Colors.black26, blurRadius: 2)],
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {},
          indicatorColor: Colors.transparent,
          selectedIndex: 1,
          surfaceTintColor: Colors.white,
          height: 70,
          shadowColor: Colors.yellow,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home),
              label: 'Início',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
