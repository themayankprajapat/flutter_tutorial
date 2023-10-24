import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorial/screens/inittail_screen.dart';
import 'package:flutter_tutorial/todo_app/todo_bloc/todo_bloc.dart';
import 'package:flutter_tutorial/utils/firebase_options.dart';
import 'package:flutter_tutorial/hive/hive_db.dart';
import 'package:flutter_tutorial/hive/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();
final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox(boxName);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return
        // MultiProvider(
        //   providers: [
        //     ChangeNotifierProvider(create: (context) => CartProvider()),
        //     ChangeNotifierProvider(create: (context) => AuthProvider()),
        //     ChangeNotifierProvider(create: (context) => UserProvider()),
        //   ],
        //   child:
        MultiBlocProvider(
      providers: [BlocProvider(create: (context) => TodoBloc())],
      child: MaterialApp(
        navigatorKey: navigatorKey,
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
        home: const InitialScreen(),
      ),
    );
  }
}
