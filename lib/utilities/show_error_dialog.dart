import 'package:flutter/material.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('error occured'),
          content: Text(text),
          actions: [
            TextButton(
              onPressed: () => {
                Navigator.of(context).pop(),
              },
              child: const Text('ok'),
            )
          ],
        );
      });
}
