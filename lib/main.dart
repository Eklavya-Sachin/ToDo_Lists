import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_lists/auth/main_page.dart';
import 'package:to_do_lists/screens/drawer_screen/setting.dart';
import 'package:to_do_lists/screens/home_page.dart';
import 'package:to_do_lists/screens/drawer_screen/reminder.dart';
import 'package:to_do_lists/screens/drawer_screen/trash.dart';
import 'package:to_do_lists/themes/theme_constant.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: const MainPage(),
      routes: {
        MyRoutes.reminder: (context) => const Reminder(),
        MyRoutes.setting: (context) => SettingScreen(),
        MyRoutes.trash: (context) => const Trash(),
        "/home": (context) => const HomePage(),
      },
    );
  }
}

class MyRoutes {
  static String reminder = "/reminder";
  static String trash = "/trash";
  static String setting = "/setting";
}
