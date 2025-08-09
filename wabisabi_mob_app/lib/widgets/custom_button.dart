import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget text;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style:
            ElevatedButton.styleFrom(backgroundColor: const Color(0xffE2E5E8)),
        child: text);
  }
}
