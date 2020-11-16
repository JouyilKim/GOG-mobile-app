import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//TODO: webview go back button
class Calc extends StatefulWidget {
      @override
      _CalcState createState() => _CalcState();
    }

class _CalcState extends State<Calc> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
        child:
        WebView(
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: <JavascriptChannel>[
            JavascriptChannel(name: 'Print', onMessageReceived: (JavascriptMessage msg) { print(msg); }),
          ].toSet(),
          initialUrl: 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/tools-and-information/tools/points-indicator-smc-28aug',
        )
    );
  }
}
