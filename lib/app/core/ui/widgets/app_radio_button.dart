import 'package:flutter/material.dart';

import '../theme/app_typography.dart';

class AppRadioButton<T> extends StatefulWidget {
  const AppRadioButton({super.key, required this.items, required this.onChange});
  final ValueChanged<T?> onChange;
  final List<T> items;

  @override
  State<AppRadioButton<T>> createState() => _AppRadioButtonState<T>();
}

class _AppRadioButtonState<T> extends State<AppRadioButton<T>> with AutomaticKeepAliveClientMixin {
  T? selected;
  @override
  Widget build(BuildContext context) {
    super.build(context); //this line is needed
    return Transform.translate(
      offset: const Offset(0, 0),
      child: ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.items.length,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () => onChanged(widget.items[index]),
            child: AppRichText(
              children: [
                WidgetSpan(
                    child: Container(
                      height: 16,
                      width: 16,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: widget.items[index] == selected
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.error,
                        ),
                      ),
                      child: widget.items[index] == selected
                          ? CircleAvatar(backgroundColor: Theme.of(context).colorScheme.primary)
                          : null,
                    ),
                    alignment: PlaceholderAlignment.middle),
                TextSpan(
                  text: '  ${widget.items[index].toString()}',
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void onChanged(T? value) {
    widget.onChange(value);
    setState(() {
      selected = value;
    });
  }

  @override
  bool get wantKeepAlive => true;
}
