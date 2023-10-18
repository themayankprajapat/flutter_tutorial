import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/api_service/firebasea_api.dart';
import 'package:flutter_tutorial/api_service/user_service.dart';
import 'package:flutter_tutorial/models/api_user.dart';
import 'package:flutter_tutorial/models/photo_model.dart';
import 'package:flutter_tutorial/models/random_user.dart';
import 'package:flutter_tutorial/todo_app/db_helper.dart';
import 'package:flutter_tutorial/todo_app/todo_model.dart';

final userProvider = ChangeNotifierProvider((ref) => UserProvider());

class UserProvider extends ChangeNotifier {
  final service = UserService();

  List<ApiUser> apiUserList = [];
  List<PhotoModel> photos = [];
  List<TodoModel> todos = [];
  List<TodoModel> fireTodos = [];

  RandomUser? randomUser;

  String? _title;
  set setTitle(String? val) => _title = val;

  String? _body;
  set setBody(String? val) => _body = val;

  Future<void> getApiUsers() async {
    final response = await service.getUsersApi();

    apiUserList = response;
    notifyListeners();
  }

  Future<RandomUser?> getRandomUser() async {
    final response = await service.getRandomUserApi();
    randomUser = response;
    log(response.toString(), name: 'randomuser');
    notifyListeners();
    return response;
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

  Future<int> getTodos({int limit = 10, int offset = 0}) async {
    final response = await DBHelper.instance.getTodos(limit, offset);
    offset == 0 ? todos = response : todos += response;
    notifyListeners();
    return response.length;
  }

  Future<int> getFireTodos({int limit = 10, int offset = 0}) async {
    try {
      final response = await FireBaseApi.instance.getTodo();
      List<TodoModel> tempData = List.from(
        response.map((e) => TodoModel.fromJson(e.data())),
      );
      log(response.toString(), name: 'getFireTodss');
      fireTodos = tempData;
      notifyListeners();
    } catch (e) {
      log(e.toString(), name: 'getFireTodss');
    }
    return 0;
  }
}
