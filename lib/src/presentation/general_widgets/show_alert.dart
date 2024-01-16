import 'package:flutter/material.dart';

void showAlert({required BuildContext context, String? title, String? content}) {
  final content0 = content ?? '';
  showDialog(context: context, builder: (context) => AlertDialog(
    title: title != null
    ? Text(title, style: const TextStyle(fontWeight: FontWeight.w600))
    : null,
  content: Text(content0),
  actions: <Widget>[
    TextButton(
        onPressed: Navigator.of(context).pop,
        child: const Text(
          'Ok',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
    ),
  ],
  ));
}