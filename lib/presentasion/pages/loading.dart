import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:hcm1011/presentasion/themes/global_themes.dart';

class WebViewExample extends StatefulWidget {
  const WebViewExample({Key? key}) : super(key: key);

  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkdarkBlueColor,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'KB-1011',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous page
          },
        ),
      ),
      body: WebView(
        initialUrl:
            'https://kb.1011.co.id/', // Ganti dengan URL yang diinginkan
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
