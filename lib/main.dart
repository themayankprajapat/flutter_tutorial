import 'package:flutter/material.dart';
import 'package:flutter_tutorial/hive/hive_db.dart';
import 'package:flutter_tutorial/hive/todo.dart';
import 'package:flutter_tutorial/providers/auth_provider.dart';
import 'package:flutter_tutorial/providers/cart_provider.dart';
import 'package:flutter_tutorial/providers/user_provider.dart';
import 'package:flutter_tutorial/todo_app/todo_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox(boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: messengerKey,
        // initialRoute: Routes.home,
        // routes: Routes.routes,
        debugShowCheckedModeBanner: false,
        title: "Flutter Tutorial",
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.deepOrange,
            iconTheme: IconThemeData(color: Colors.amber),
          ),
          // colorScheme: ColorScheme.fromSeed(
          //   seedColor: const Color.fromARGB(255, 124, 196, 255),
          // ),
        ),
        home: const TodoScreen(),
      ),
    );
  }
}
