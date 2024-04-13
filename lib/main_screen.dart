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
  late WebViewController _webViewController;

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
              _webViewController.loadUrl(value);
            },
            itemBuilder: (context) => [
              const PopupMenuItem<String>(
                  value: 'https://open.spotify.com/', child: Text('Spotify')),
              const PopupMenuItem<String>(
                  value: 'https://music.apple.com/kr/browse', child: Text('AppleMusic')),
              const PopupMenuItem<String>(
                  value: 'https://www.melon.com', child: Text('멜론')),
            ],
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
            if(await _webViewController.canGoBack()){
              await _webViewController.goBack();
              return false;
            }
          return true;
        },
        child: WebView(
          initialUrl: 'https://pub.dev',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            _webViewController = controller;
          },
        ),
      ),
    );
  }
}
