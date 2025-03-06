import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'calculator_screen.dart';

void main() {
  runApp(MyApp());
}

// Root Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system, // Automatically detects dark/light mode
      theme: ThemeData.light(), // Light Theme
      darkTheme: ThemeData.dark(), // Dark Theme
      home: CalculatorScreen(), // Start at the Calculator Screen
    );
  }
}
