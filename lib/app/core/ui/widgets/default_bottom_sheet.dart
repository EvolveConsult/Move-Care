import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:moveecare/app/core/ui/theme/app_typography.dart';
import 'app_bottom_sheet.dart';
import 'app_button_widget.dart';

class DefaultBottomSheet {
  final String? title;
  final Widget content;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final String? confirmText;
  final String? cancelText;
  final bool? enableDrag;
  final bool? willPop;
  final bool? isDismissible;
  final bool centerTitle;

  DefaultBottomSheet({
    this.title,
    required this.content,
    this.onConfirm,
    this.confirmText,
    this.onCancel,
    this.cancelText,
    this.enableDrag,
    this.willPop,
    this.isDismissible,
    this.centerTitle = false,
  }) : assert(
          cancelText != null && onCancel != null || cancelText == null && onCancel == null || onCancel != null,
          'Ao passar "cancelText" você precisa passar o "onCancel"',
        );

  Future<void> showDefaultBottomSheet({required BuildContext context, bool? enableDrag}) async {
    await AppBottomSheet().call(
      enableDrag: enableDrag ?? this.enableDrag,
      willPop: willPop,
      isDismissible: isDismissible,
      title: title == null
          ? null
          : AppText(
              title!,
              size: AppTextSize.great,
              textStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface, fontWeight: FontWeight.w500),
            ),
      content: [
        content,
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (onCancel != null && cancelText != null) ...[
              Expanded(
                  child: AppButton(
                text: cancelText!,
                onTap: onCancel!,
                type: AppButtonWidgetType.transparent,
              )),
              const SizedBox(width: 16)
            ],
            Expanded(child: AppButton(text: confirmText ?? 'Confirmar', onTap: onConfirm ?? Modular.to.pop)),
          ],
        )
      ],
      context: context,
    );
  }
}
