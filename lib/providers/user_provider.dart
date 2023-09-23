import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/api_service/user_service.dart';
import 'package:flutter_tutorial/models/api_user.dart';

class UserProvider extends ChangeNotifier {
  final service = UserService();

  List<ApiUser> apiUserList = [];

  String? _title;
  set setTitle(String? val) => _title = val;

  String? _body;
  set setBody(String? val) => _body = val;

  Future<void> getApiUsers() async {
    final response = await service.getUsersApi();

    if (response != null) {
      apiUserList = response;
      notifyListeners();
    }
  }

  Future<void> createPost() async {
    try {
      Map<String, dynamic> data = {
        "title": _title,
        "body": _body,
        "userId": "userid"
      };
      await service.createPostApi(data);
    } catch (e) {
      log(e.toString(), name: 'error catch createPost');
    }
  }
}
