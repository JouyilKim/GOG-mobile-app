import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:global_ocean_group_app/Localization/app_localizations.dart';

class WagePage extends StatefulWidget {
  @override
  _WagePageState createState() => _WagePageState();
}

class _WagePageState extends State<WagePage> {

  void initState() {
    super.initState();
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('immigration_page')),
      ),
      body:
      Container(
          child:
          WebView(
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: <JavascriptChannel>[
              JavascriptChannel(name: 'Print', onMessageReceived: (JavascriptMessage msg) { print(msg); }),
            ].toSet(),
            initialUrl: getUrl(myLocale),
          )
      ),
    );
  }
}

String getUrl (myLocale){
  if(myLocale==Locale('zh','CN')){
    return 'https://translate.google.com/translate?sl=auto&tl=zh-CN&u=https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/tools-and-information/work-and-employment/employment-skill-bands/employment-skill-bands-for-essential-skills-work-visas%23:~:text%3DIf%2520you%2520earn%2520below%2520the,currently%2520NZD%2520%252443%252C322.76%2520a%2520year.';
  }
  else{
    return 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/tools-and-information/work-and-employment/employment-skill-bands/employment-skill-bands-for-essential-skills-work-visas#:~:text=If%20you%20earn%20below%20the,currently%20NZD%20%2443%2C322.76%20a%20year.';
  }
}
