import 'package:flutter/services.dart';

class EnglishInputFormatter extends TextInputFormatter {
  final RegExp _englishRegExp = RegExp(r'^[a-zA-Z\s]*$');

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (_englishRegExp.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}