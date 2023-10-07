import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial/api_service/user_service.dart';
import 'package:flutter_tutorial/models/api_user.dart';
import 'package:flutter_tutorial/models/photo_model.dart';
import 'package:flutter_tutorial/todo_app/db_helper.dart';
import 'package:flutter_tutorial/todo_app/todo_model.dart';

class UserProvider extends ChangeNotifier {
  final service = UserService();

  List<ApiUser> apiUserList = [];
  List<PhotoModel> photos = [];

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

  Future<int> getPhotos({int limit = 10, int offset = 1}) async {
    final response = await service.getPhotosApi(limit, offset);

    debugPrint('$response getPhotos');
    List<PhotoModel> tempList = List<PhotoModel>.from(
      response.map((e) => PhotoModel.fromJson(e)),
    );
    offset == 1 ? photos = tempList : photos += tempList;
    notifyListeners();
    return tempList.length;
  }

  List<TodoModel> todos = [];

  Future<int> getTodos({int limit = 10, int offset = 0}) async {
    final response = await DBHelper.instance.getTodos(limit, offset);
    offset == 0 ? todos = response : todos += response;
    notifyListeners();
    return response.length;
  }
}
