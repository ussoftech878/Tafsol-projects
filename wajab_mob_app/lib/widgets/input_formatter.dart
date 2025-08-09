import 'package:flutter/services.dart';

class PhoneNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(' ', ''); // Remove existing spaces
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      if (i == 4) {
        buffer.write(' '); // Add space after the first 4 characters
      }
      buffer.write(text[i]);
    }

    final formattedText = buffer.toString();

    // Maintain cursor position
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
        offset: formattedText.length,
      ),
    );
  }
}
