import 'dart:convert';
import 'dart:developer';

import 'package:flutter_tutorial/api_service/base_service.dart';
import 'package:flutter_tutorial/models/api_user.dart';
import 'package:flutter_tutorial/models/random_user.dart';
import 'package:flutter_tutorial/utils/api_urls.dart';

class UserService extends BaseService {
  Future<List<ApiUser>?> getUsersApi() async {
    try {
      final response = await getHttp(ApiUrls.user);
      log(response.body, name: 'getUsersApi');
      final userMapList = json.decode(response.body);

      if (response.statusCode != 200) return null;
      List<ApiUser> userList =
          List<ApiUser>.from(userMapList.map((e) => ApiUser.fromJson(e)));

      log(userMapList.toString(), name: 'getUsersApi response');

      return userList;
    } catch (e, s) {
      log(e.toString(), name: 'error getUserAPi', stackTrace: s);
      return null;
    }
  }

  Future<RandomUser?> getRandomUserApi() async {
    try {
      final response = await getHttp('');
      log(response.body, name: 'getRandomUserApi');
      final userMap = json.decode(response.body);

      if (response.statusCode != 200) return null;
      RandomUser user = RandomUser.fromJson(userMap['results'][0]);

      log(userMap.toString(), name: 'getRandomUserApi response');

      return user;
    } catch (e, s) {
      log(e.toString(), name: 'error getRandomUserApi', stackTrace: s);
      return null;
    }
  }

  Future<void> createPostApi(Map<String, dynamic> body) async {
    final response = await postHttp(api: ApiUrls.posts, data: body);
    if (response.statusCode == 201) {
      log('Post created Successfully', name: 'response createPostApi');
      log(response.body, name: 'response createPostApi');
    } else {
      log('Some error occurred', name: 'error createPostApi');
    }
  }
}
