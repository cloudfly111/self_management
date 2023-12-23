import 'package:flutter/material.dart';
import 'package:self_management/screens/HealthStatusScreen.dart';
import 'package:self_management/screens/HomeScreen.dart';
import 'package:self_management/screens/LoginScreen.dart';
import 'package:self_management/screens/StressControlScreen.dart';
import 'package:self_management/screens/WelcomeScreen.dart';
import 'package:self_management/screens/WorkScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String sAppName = "自我狀態管理";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: sAppName,
      home: StressScontrolScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
