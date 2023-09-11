import 'package:flutter_tutorial/screens/stateful_screen.dart';
import 'package:flutter_tutorial/screens/user_screen.dart';

class Routes {
  static const home = '/';
  static const chat = '/chat';
  static const state = '/state';

  static final routes = {
    home: (context) => const UserScreen(),
    // chat: (context) => const TextFieldScreen(),
    state: (context) => const StatefulScreen(),
  };
}
