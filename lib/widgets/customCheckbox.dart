import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final String firsttext;
  final String secondtext;
  final ValueChanged<bool> onChanged;
  final bool isSignUp;
  final VoidCallback? ontap;
  const CustomCheckbox({
    super.key,
    required this.value,
    required this.firsttext,
    required this.secondtext,
    required this.onChanged,
    this.ontap,
    this.isSignUp = false, // Default to false for checkbox in sign up page.
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
        isSignUp
            ? Row(
                children: [
                  Text(firsttext,
                      style: const TextStyle(
                        fontSize: 14.0,
                      )),
                  InkWell(
                    onTap: ontap,
                    child: Text(secondtext,
                        style: const TextStyle(
                            fontSize: 14.0, color: Colors.blue)),
                  ),
                ],
              )
            : Text(firsttext, style: const TextStyle(fontSize: 14.0)),
      ],
    );
  }
}
