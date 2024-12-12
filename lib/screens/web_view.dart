import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShiftLogWebView extends StatefulWidget {
  final String url;

  const ShiftLogWebView({Key? key, required this.url}) : super(key: key);

  @override
  _ShiftLogWebViewState createState() => _ShiftLogWebViewState();
}

class _ShiftLogWebViewState extends State<ShiftLogWebView> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shift Log'),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}

