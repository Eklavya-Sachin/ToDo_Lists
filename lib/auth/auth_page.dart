import 'package:flutter/material.dart';
import 'package:to_do_lists/screens/login/login_page.dart';
import 'package:to_do_lists/screens/login/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleSrceen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return  LoginPage(showRegisterPage: toggleSrceen);
    } else {
      return  RegisterPage(showLoginPage: toggleSrceen);
    }
  }
}
