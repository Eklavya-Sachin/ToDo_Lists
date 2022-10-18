import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_lists/screens/home_page.dart';
import 'package:to_do_lists/screens/login_page.dart';
import 'package:to_do_lists/themes/theme_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        themeMode: ThemeMode.system,
        title: "ToDo Lists",
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
        routes: {
          "/login": (context) => const LoginPage(),
          "/home": (context) => const HomePage()
        });
  }
}
