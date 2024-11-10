import 'package:flutter/material.dart';
import 'package:gropto/helper/app_images.dart';
import 'dart:async'; // for Timer
import 'package:webview_flutter/webview_flutter.dart';

import '../layouts/popup_layout.dart';
import '../layouts/splash_layout.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late WebViewController _controller;
  bool isSplashFinished = false;

  @override
  void initState() {
    super.initState();
    // Initialize WebView in the background as soon as the splash screen appears
    _initializeWebView();

    // Wait for 3 seconds before showing the WebView screen
    Timer(Duration(seconds: 10), () {
      setState(() {
        isSplashFinished = true;
      });
    });
  }

  // Initialize the WebViewController in the background (without showing it)
  void _initializeWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (String url) {
          print("Page started: $url");
        },
        onPageFinished: (String url) {
          print("Page finished: $url");
        },
        onWebResourceError: (WebResourceError error) {
          print("Web resource error: ${error.errorCode}");
        },
      ))
      ..loadRequest(Uri.parse('https://gropto.com/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // The WebView that is running in the background
          PopUpLayout(controller: _controller,),

          // The Splash Screen which is shown over the WebView
          if (!isSplashFinished)
            SplashLayout(),
        ],
      ),
    );
  }
}