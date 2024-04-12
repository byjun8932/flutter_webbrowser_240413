import 'package:flutter/material.dart';
import 'package:flutter_webbrowser_240413/theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('나만의 웹브라우저'),
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer.tone(85),
      ),
    );
  }
}
