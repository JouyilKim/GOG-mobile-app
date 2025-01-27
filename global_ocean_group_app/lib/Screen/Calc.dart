import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:global_ocean_group_app/Localization/app_localizations.dart';


class Calc extends StatefulWidget {
      @override
      _CalcState createState() => _CalcState();
    }

class _CalcState extends State<Calc> {

  @override
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
    return 'https://translate.google.com/translate?sl=auto&tl=zh-CN&u=https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/tools-and-information/tools/points-indicator-smc-28aug';
  }
  else{
    return 'https://www.immigration.govt.nz/new-zealand-visas/apply-for-a-visa/tools-and-information/tools/points-indicator-smc-28aug';
  }
}
