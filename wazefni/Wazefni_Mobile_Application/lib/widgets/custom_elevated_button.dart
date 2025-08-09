import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  final bool isEnabled;
  final VoidCallback onPressed;
  final Widget child;

  const CustomElevatedButton({
    super.key,
    required this.isEnabled,
    required this.onPressed,
    required this.child,
  });

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.isEnabled ? widget.onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            widget.isEnabled ? Theme.of(context).primaryColor : Colors.orange,
      ),
      child: widget.child,
    );
  }
}
