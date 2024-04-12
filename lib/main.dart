import 'package:flutter/material.dart';
import 'package:flutter_webbrowser_240413/main_screen.dart';
import 'package:flutter_webbrowser_240413/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web browser ',
      theme: lightTheme,
      home: const MainScreen()
    );
  }
}

