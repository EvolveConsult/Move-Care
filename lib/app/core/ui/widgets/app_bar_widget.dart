import '../theme/app_typography.dart';
import 'app_button_previus_widget.dart';
import 'package:flutter/material.dart';

enum LeadingActionType { previous, none }

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actionsAppBar;
  final LeadingActionType leadingActionType;
  final VoidCallback? leadingAction;
  final String appTitle;
  final TextStyle? appTitleStyle;
  final Color? backgroundColorAppBar;
  final Color? closeButtonColor;
  final Widget? leadingActionWidget;

  const AppBarWidget({
    super.key,
    this.appTitle = '',
    this.actionsAppBar = const [],
    this.leadingAction,
    this.appTitleStyle,
    this.leadingActionWidget,
    this.backgroundColorAppBar,
    this.closeButtonColor,
    required this.leadingActionType,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 8,
      backgroundColor: backgroundColorAppBar ?? Theme.of(context).colorScheme.background,
      leading: leadingWidget(),
      actions: actionsAppBar,
      title: AppText(
        appTitle,
        size: AppTextSize.verySmall,
        textStyle: const TextStyle(fontWeight: FontWeight.w500),
        maxLine: 3,
      ),
      centerTitle: true,
      elevation: 0,
    );
  }

  Widget? leadingWidget() {
    switch (leadingActionType) {
      case LeadingActionType.previous:
        return AppButtonPreviusWidget(onTap: leadingAction);
      case LeadingActionType.none:
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
