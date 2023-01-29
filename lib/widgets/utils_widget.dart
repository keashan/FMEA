import 'package:flutter/material.dart';

class Utils {
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? message) {
    if (message == null) return;

    final snackBar = SnackBar(content: Text(message), backgroundColor: Colors.red, duration: const Duration(seconds: 10),);

    messengerKey.currentState!
      ..removeCurrentSnackBar
      ..showSnackBar(snackBar);
  }
}