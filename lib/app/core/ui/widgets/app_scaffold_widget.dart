import 'package:flutter/material.dart';

import 'app_bar_widget.dart';
import 'default_bottom_sheet.dart';

class AppScaffoldWidget extends StatefulWidget {
  final bool extendBodyBehindAppBar;
  final VoidCallback? onTap;
  final String title;
  final Widget page;
  final VoidCallback? leadingAction;
  final EdgeInsetsGeometry pagePadding;
  final bool? resizeToAvoidBottomInset;
  final Widget? bottomSheet;
  final bool leadingActive;
  final Widget? bottomNavigationBar;
  final List<Widget>? actionsAppBar;
  final Widget? leadingActionWidget;
  final Color? backgroundColorAppBar;
  final VoidCallback? handleError;
  final bool canPop;
  final Future<bool> Function()? onWillPop;
  final bool hasAppBar;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final bool extendBody;
  final LeadingActionType leadingActionType;
  final ValueNotifier<DefaultBottomSheet?>? bottomSheetAlert;

  const AppScaffoldWidget({
    super.key,
    this.onTap,
    this.floatingActionButton,
    this.handleError,
    this.title = '',
    required this.page,
    this.leadingActive = true,
    this.leadingAction,
    this.actionsAppBar = const [],
    this.pagePadding = const EdgeInsets.symmetric(horizontal: 20),
    this.resizeToAvoidBottomInset = false,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.leadingActionWidget,
    this.backgroundColorAppBar,
    this.canPop = true,
    this.onWillPop,
    this.hasAppBar = true,
    this.extendBodyBehindAppBar = false,
    this.backgroundColor,
    this.extendBody = false,
    this.leadingActionType = LeadingActionType.previous,
    this.bottomSheetAlert,
  });

  @override
  State<AppScaffoldWidget> createState() => _AppScaffoldWidgetState();
}

class _AppScaffoldWidgetState extends State<AppScaffoldWidget> {
  void handleError() {
    if (widget.bottomSheetAlert?.value != null) {
      widget.bottomSheetAlert?.value!.showDefaultBottomSheet(context: context);
    }

    widget.bottomSheetAlert?.value = null;
  }

  @override
  void initState() {
    widget.bottomSheetAlert?.addListener(widget.handleError ?? handleError);
    super.initState();
  }

  @override
  void dispose() {
    widget.bottomSheetAlert?.removeListener(widget.handleError ?? handleError);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: widget.onTap ?? () => FocusManager.instance.primaryFocus?.unfocus(),
        child: PopScope(
          canPop: widget.canPop,
          child: Scaffold(
            floatingActionButton: widget.floatingActionButton,
            backgroundColor: widget.backgroundColor ?? Theme.of(context).colorScheme.background,
            resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
            extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
            extendBody: widget.extendBody,
            appBar: widget.hasAppBar ? appBarWidget() : null,
            bottomSheet: widget.bottomSheet,
            bottomNavigationBar: widget.bottomNavigationBar,
            body: Container(
              padding: widget.pagePadding,
              color: widget.backgroundColor ?? Theme.of(context).colorScheme.background,
              child: widget.page,
            ),
          ),
        ),
      ),
    );
  }

  AppBarWidget appBarWidget() {
    return AppBarWidget(
      leadingActionType: widget.leadingActionType,
      backgroundColorAppBar: widget.backgroundColorAppBar,
      actionsAppBar: widget.actionsAppBar,
      leadingActionWidget: widget.leadingActionWidget,
      appTitle: widget.title,
      leadingAction: widget.leadingAction,
    );
  }
}
