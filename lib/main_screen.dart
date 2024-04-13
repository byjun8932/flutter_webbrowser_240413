import 'package:flutter/material.dart';
import 'package:flutter_webbrowser_240413/theme.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).colorScheme.tertiaryContainer.tone(85),
        title: const Text('나만의 웹브라우저'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                  value: 'https://www.google.com', child: Text('구글')),
              const PopupMenuItem<String>(
                  value: 'https://www.daum.net', child: Text('다음')),
              const PopupMenuItem<String>(
                  value: 'https://www.kakao.com', child: Text('카카오')),
            ],
          ),
        ],
      ),
      body: const WebView(
        initialUrl: 'https://www.pub.dev',
      ),
    );
  }
}
