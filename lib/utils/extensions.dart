import 'package:flutter/material.dart';

extension DateTimeHelper on DateTime {
  String toDate() {
    return '$day/$month/$year';
  }
}

extension TimeHelper on TimeOfDay {
  String toTime() {
    return '$hour:$minute';
  }
}
