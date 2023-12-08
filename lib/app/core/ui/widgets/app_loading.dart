import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../main.dart';

void showAppLoading({BuildContext? context}) {
  final ctx = context ?? AppGlobalKeys.navigatorKey.currentContext;
  if (ctx != null) ctx.loaderOverlay.show();
}

void hideAppLoading() {
  final ctx = AppGlobalKeys.navigatorKey.currentContext;
  if (ctx != null) ctx.loaderOverlay.hide();
}

bool get appLoadingVisible {
  final ctx = AppGlobalKeys.navigatorKey.currentContext;
  if (ctx != null) return ctx.loaderOverlay.visible;
  return false;
}
