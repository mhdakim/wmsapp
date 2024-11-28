import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Warehouse Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3), // Set the duration for your splash screen
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const LoginPage()), // Navigate to LoginPage after the splash screen
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00124E), // Navy blue background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'lib/assets/logo.png', // Path to your logo
              width: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'WAREHOUSE MANAGEMENT SYSTEM',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,  // White color for consistency with main.dart
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'SECURIFORCE LOGISTIC SDN BHD',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFFEF202), // Gold color to match main.dart
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
