import 'package:flutter/material.dart';
import 'package:flutter_login_bloc/src/screens/login_screen.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login BLoC",
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
