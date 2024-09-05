import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 버튼을 누르면 WebView 페이지로 이동
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WebViewPage()),
            );
          },
          child: Text('Open Google WebView'),
        ),
      ),
    );
  }
}

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // WebViewController를 초기화합니다.
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.google.com'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google WebView'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // 페이지 새로고침 기능
              _controller.reload();
            },
          ),
        ],
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
