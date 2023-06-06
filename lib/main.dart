import 'package:flutter/material.dart';
import 'package:test_app/screen/login_screen_page.dart';

void main() {
  runApp(const LoginUI());
}

class LoginUI extends StatelessWidget {
  const LoginUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),

    );
  }
}  