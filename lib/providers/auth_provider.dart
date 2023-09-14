import 'dart:developer';

import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  // String? _email;
  // String? get email => _email;
  // set setEmail(String? val) => _email = val;

  // String? _password;
  // String? get password => _password;
  // set setPassword(String? val) => _password = val;

  void login(String email, String password) {
    // _email = email;
    log(email);
    log(password);
  }
}
