import 'package:flutter_tutorial/models/messages.dart';

class UserModel {
  final String name;
  final int age;
  final String avatar;
  final List<Messages> messages;

  UserModel({
    required this.name,
    required this.avatar,
    required this.age,
    required this.messages,
  });
}
