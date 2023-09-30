import 'package:flutter/material.dart';
import 'package:flutter_tutorial/providers/auth_provider.dart';
import 'package:flutter_tutorial/providers/cart_provider.dart';
import 'package:flutter_tutorial/providers/user_provider.dart';
import 'package:flutter_tutorial/screens/pageview_screen.dart';
import 'package:provider/provider.dart';

void main() {
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
        home: const PageViewScreen(),
      ),
    );
  }
}
