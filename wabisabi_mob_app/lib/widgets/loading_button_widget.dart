import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  final Future<void> Function() onPressed;

  const LoadingButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool isLoading = false;

  // Function to handle the button press
  void _handlePress() async {
    setState(() {
      isLoading = true;
    });

    await widget.onPressed();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : _handlePress,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: isLoading ? 60.0 : 200.0, // Button width changes when loading
        height: 60.0, // Fixed height
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: isLoading
              ? BorderRadius.circular(30.0)
              : BorderRadius.circular(8.0),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                'Press me',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
      ),
    );
  }
}
