import 'package:flutter/material.dart';

class AppBottomSheet<T> {
  Future<T?> call({
    Widget? title,
    required List<Widget> content,
    required BuildContext context,
    double? maxHeight,
    double? minHeight,
    Widget? footer,
    bool isScrollControlled = true,
    bool? enableDrag,
    bool? isDismissible,
    EdgeInsets? padding,
    bool? willPop,
  }) async {
    var result = await showModalBottomSheet<T?>(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible ?? true,
      enableDrag: enableDrag ?? true,
      context: context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: willPop ?? true,
          child: Padding(
            padding: padding ?? const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _topBottomSheet(context),
                if (title != null) ...[const SizedBox(height: 12), title, const SizedBox(height: 16)],
                Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.sizeOf(context).height - View.of(context).viewPadding.top,
                    ),
                    child: ScrollConfiguration(
                        behavior: const ScrollBehavior().copyWith(overscroll: false),
                        child: ListView(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          children: content,
                        )))
              ],
            ),
          ),
        );
      },
    );
    return result;
  }
}

Widget _topBottomSheet(BuildContext context) {
  return Center(
    child: Container(
      margin: const EdgeInsets.only(top: 16),
      height: 5,
      width: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
    ),
  );
}
