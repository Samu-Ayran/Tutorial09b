import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const TechServiceApp());
}

class TechServiceApp extends StatelessWidget {
  const TechServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TechService',
      theme: ThemeData(useMaterial3: true),
      home: const LoginScreen(),
    );
  }
}
