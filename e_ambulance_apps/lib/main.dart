import 'package:e_ambulance_apps/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e - Ambulance',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
