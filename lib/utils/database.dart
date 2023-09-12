import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/messages.dart';
import 'package:flutter_tutorial/models/user_model.dart';

List<UserModel> users = List.generate(
  20,
  (index) => UserModel(
    name: 'Some ${index + 1}',
    avatar: "https://picsum.photos/id/${200 + index}/200/300",
    age: 20 + index,
    messages: List.generate(
      3,
      (index) => Messages(
        text: 'text $index',
        time: TimeOfDay.now(),
      ),
    ),
  ),
);
