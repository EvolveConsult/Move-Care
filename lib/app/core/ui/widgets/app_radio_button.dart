import 'package:flutter/material.dart';

import '../theme/app_typography.dart';

class AppRadioButton<T> extends StatefulWidget {
  const AppRadioButton({super.key, required this.items, required this.onChange});
  final ValueChanged<T?> onChange;
  final List<T> items;

  @override
  State<AppRadioButton<T>> createState() => _AppRadioButtonState<T>();
}

class _AppRadioButtonState<T> extends State<AppRadioButton<T>> {
  T? selected;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.items.length,
      itemBuilder: (_, index) {
        return ListTile(
          title: AppText(widget.items[index].toString()),
          contentPadding: EdgeInsets.zero,
          splashColor: Colors.transparent,
          onTap: () {
            onChanged(widget.items[index]);
          },
          horizontalTitleGap: 8,
          visualDensity: VisualDensity.compact,
          leading: Radio<T>(
            visualDensity: VisualDensity.compact,
            value: widget.items[index],
            groupValue: selected,
            onChanged: onChanged,
          ),
        );
      },
    );
  }

  void onChanged(T? value) {
    widget.onChange(value);
    setState(() {
      selected = value;
    });
  }
}
