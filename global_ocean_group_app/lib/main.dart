//Libraries
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

//classes
import 'Localization/app_localizations.dart';
import 'Localization/AppLanguage.dart';

//Screens
import 'Screen/News.dart';
import 'Screen/Calc.dart';
import 'Screen/Service2.dart';
import 'Screen/AboutUs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}

class MyApp extends StatelessWidget {
  final AppLanguage appLanguage;
  MyApp({this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
      create: (_) => appLanguage,
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return new MaterialApp(
          locale: model.appLocal,
          title: 'Global Ocean Group App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          supportedLocales: [
            const Locale('en', 'US'),
            const Locale('zh', 'CN'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: MinorPage(title: 'Global Ocean Group'),
        );
      }),
    );
  }
}

@override
//this is the one I use now
class MinorPage extends StatefulWidget {
  MinorPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MinorPageState createState() => _MinorPageState();
}

class _MinorPageState extends State<MinorPage> {
  int selectedIndex = 0;
  PageController controller = PageController();

  final pageNavigator = [
    News(),
    Service2(),
    Calc(),
    AboutUs(),
  ];

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);

    return Scaffold(
      appBar: AppBar(
        // leading: Padding(
        //   padding: const EdgeInsets.only(left: 10.0),
        //   child: Image.asset('images/logo.png'),
        // ),
        title: Text(AppLocalizations.of(context).translate('title')),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(

              decoration: BoxDecoration(
                color: Colors.blue,

              ),
              child: Text(
                AppLocalizations.of(context).translate('options'),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
                title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/language.png',
                  height: 70,
                  width: 70,
                ),
                RaisedButton(
                  onPressed: () {
                    appLanguage.changeLanguage(Locale("en"));
                    Navigator.pop(context);
                  },
                  child: Text('English'),
                ),
                RaisedButton(
                    onPressed: () {
                      appLanguage.changeLanguage(Locale("zh"));
                      Navigator.pop(context);
                    },
                    child: Text('中文')),
              ],
            )),
            Padding(padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),),
            Text(AppLocalizations.of(context).translate('wechat'),
            textAlign: TextAlign.center,),
            Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),),
            Container(
              alignment: Alignment.center,
              child:Image.asset("images/wechat.jpg", width: 200,)
            )
          ],
        ),
      ),
      body: Center(child: pageNavigator.elementAt(selectedIndex)),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.white,
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          selectedItemTextStyle: TextStyle(fontSize: 15),
          barHeight: 70,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.new_releases,
            label: AppLocalizations.of(context).translate('news'),
          ),
          FFNavigationBarItem(
            iconData: Icons.business_center,
            label: AppLocalizations.of(context).translate('services'),
          ),
          FFNavigationBarItem(
            iconData: Icons.forum,
            label: AppLocalizations.of(context).translate('immigrant'),
          ),
          FFNavigationBarItem(
            iconData: Icons.assignment_ind,
            label: AppLocalizations.of(context).translate('about_us'),
          ),
        ],
      ),
    );
  }
}
