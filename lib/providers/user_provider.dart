import 'package:flutter/material.dart';
import 'package:flutter_tutorial/api_service/user_service.dart';
import 'package:flutter_tutorial/models/api_user.dart';

class UserProvider extends ChangeNotifier {
  final service = UserService();

  List<ApiUser> apiUserList = [];

  Future<void> getApiUsers() async {
    final response = await service.getUsersApi();

    if (response != null) {
      apiUserList = response;
      notifyListeners();
    }
  }
}
