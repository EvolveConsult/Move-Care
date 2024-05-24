import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/functions/open_url.dart';
import '../../../../core/ui/theme/app_typography.dart';
import '../../../../core/ui/widgets/app_checkbox_widget.dart';

class AcceptTermsWidget extends StatefulWidget {
  const AcceptTermsWidget({super.key, required this.acceptContract});
  final ValueNotifier<bool> acceptContract;

  @override
  State<AcceptTermsWidget> createState() => _AcceptTermsWidgetState();
}

class _AcceptTermsWidgetState extends State<AcceptTermsWidget> {
  @override
  Widget build(BuildContext context) {
    return AppRichText(
      children: [
        WidgetSpan(child: AppCheckbox(notifier: widget.acceptContract), alignment: PlaceholderAlignment.middle),
        const TextSpan(text: '  Li e concordo com a'),
        TextSpan(
          text: ' política de privacidade e termo de uso ',
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
          recognizer: TapGestureRecognizer()..onTap = onTapTerms,
        ),
        const TextSpan(text: 'do Move & Care.'),
      ],
    );
  }
}
