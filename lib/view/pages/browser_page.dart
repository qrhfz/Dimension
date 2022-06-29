import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserPage extends StatefulWidget {
  const BrowserPage(this.initialUrl, {Key? key}) : super(key: key);
  final String initialUrl;

  @override
  State<BrowserPage> createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  String title = "";
  late WebViewController? controller;

  @override
  void initState() {
    super.initState();
    setState(() {
      title = widget.initialUrl;
    });
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  void dispose() {
    controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final canGoBack = await controller?.canGoBack() ?? false;
        if (canGoBack) {
          controller?.goBack();
        }

        return !canGoBack;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
              onPressed: () {
                launchUrl(Uri.parse(widget.initialUrl));
              },
              icon: const Icon(Icons.open_in_new),
            )
          ],
        ),
        body: WebView(
          initialUrl: widget.initialUrl,
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (url) async {
            final title = await controller?.getTitle();
            setState(() {
              this.title = title ?? this.title;
            });
          },
        ),
      ),
    );
  }
}
