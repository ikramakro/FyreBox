import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final String text;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.text,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (bool? newValue) {
            if (newValue != null) {
              onChanged(newValue);
            }
          },
        ),
        Text(text, style: const TextStyle(fontSize: 14.0)),
      ],
    );
  }
}
