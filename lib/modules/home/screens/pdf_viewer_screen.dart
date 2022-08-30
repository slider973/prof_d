import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../config/config_route_collection.dart';

class PdfViewer extends StatefulWidget {
  String id;
  PdfViewer({Key? key, required this.id}) : super(key: key);



  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
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
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Facture'),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: '$getBackendUrl/pdf/invoice-appointment/${widget.id}',
          javascriptMode: JavascriptMode.unrestricted,
          zoomEnabled: true,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
            _onAddToCache(webViewController, context);
          },
          gestureNavigationEnabled: true,
          backgroundColor: const Color(0x00000000),
        )
      ),
    );
  }
  Future<void> _onAddToCache(
      WebViewController controller, BuildContext context) async {
    // ignore: deprecated_member_use
  }
}
