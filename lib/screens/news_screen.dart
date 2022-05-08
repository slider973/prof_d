import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    // Enable virtual display.

    Platform.isAndroid
        ? WebView.platform = AndroidWebView()
        : WebView.platform = CupertinoWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualité'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body:  WebView(
        initialUrl: 'https://sylvie-profd.fr/index.php/blog',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
          _onAddToCache(
            webViewController,
            context
          );
        },
        gestureNavigationEnabled: true,
        backgroundColor: const Color(0x00000000),
      ),
    );
  }
  Future<void> _onAddToCache(
      WebViewController controller, BuildContext context) async {
        // ignore: deprecated_member_use
  }

}
