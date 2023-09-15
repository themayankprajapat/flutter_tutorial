import 'dart:convert';
import 'dart:developer';

import 'package:flutter_tutorial/api_service/base_service.dart';
import 'package:flutter_tutorial/models/api_user.dart';
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
}
