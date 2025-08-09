import 'package:flutter/services.dart';

class ArabicInputFormatter extends TextInputFormatter {
  final RegExp _arabicRegExp = RegExp(r'^[\u0600-\u06FF\s]*$');

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (_arabicRegExp.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}