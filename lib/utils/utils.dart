import 'package:flutter/material.dart';
import 'package:flutter_tutorial/main.dart';

class Utils {
  static bool scrollNotifier(Object? notification, VoidCallback callback) {
    if (notification is ScrollEndNotification) {
      final before = notification.metrics.extentBefore;
      final max = notification.metrics.maxScrollExtent;

      if (before == max) callback();
    }
    return false;
  }

  static void showSnack(String text) {
    messengerKey.currentState?.hideCurrentSnackBar();
    messengerKey.currentState?.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(text),
      ),
    );
  }
}
