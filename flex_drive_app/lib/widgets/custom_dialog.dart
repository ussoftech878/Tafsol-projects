import 'package:flutter/material.dart';

Future<void> customShowDialog(
  BuildContext context, {
  required String title,
  required String message,
  required Function onOk,
  required Function onCancel,
}) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              onCancel();
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton(
            child:const Text('OK'),
            onPressed: () {
              onOk();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
