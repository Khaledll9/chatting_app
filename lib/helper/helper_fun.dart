import 'package:flutter/material.dart';

void showSnakbar(BuildContext context, String massage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(massage),
    ),
  );
}
