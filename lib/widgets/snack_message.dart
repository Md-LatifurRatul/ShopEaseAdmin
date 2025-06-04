import 'package:flutter/material.dart';

class SnackMessage {
  static void showSnackMessage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(duration: Duration(milliseconds: 500), content: Text(msg)),
    );
  }
}
