import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';

import 'Screen/News.dart';
import 'Screen/Service.dart';
import 'Screen/Forum.dart';
import 'Screen/AboutUs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Ocean Group App Minor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MinorPage(title: 'Global Ocean Group'),
    );
  }
}

//too old fashioned
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  int selectedIndex = 0;
  PageController controller = PageController();

  //colors and contents for navigation bar
  List<GButton> tabs = new List();
  List<Color> colors = [
    Colors.purple,
    Colors.pink,
    Colors.amber[600],
    Colors.teal
  ];
  final pageNavigator = [
    News(),
    Service(),
    Forum(),
    AboutUs(),
  ];

  //bottom Navigation initiator
  @override
  void initState() {
    super.initState();

    var padding = EdgeInsets.symmetric(
        horizontal: 10, vertical: 10); //navigation bar size
    double gap = 15; //each tap's width

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.purple,
      iconColor: Colors.black,
      textColor: Colors.purple,
      backgroundColor: Colors.purple.withOpacity(.2),
      iconSize: 40,
      padding: padding,
      icon: LineIcons.newspaper_o,
      textStyle: TextStyle(fontSize: 20),
      text: 'News',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.pink,
      iconColor: Colors.black,
      textColor: Colors.pink,
      backgroundColor: Colors.pink.withOpacity(.2),
      iconSize: 40,
      padding: padding,
      icon: LineIcons.suitcase,
      textStyle: TextStyle(fontSize: 20),
      text: 'Services',
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.amber[600],
      iconColor: Colors.black,
      textColor: Colors.amber[600],
      backgroundColor: Colors.amber[600].withOpacity(.2),
      iconSize: 40,
      padding: padding,
      icon: LineIcons.comments_o,
      textStyle: TextStyle(fontSize: 20),
      text: ('Forum'),
    ));

    tabs.add(GButton(
      gap: gap,
      iconActiveColor: Colors.teal,
      iconColor: Colors.black,
      textColor: Colors.teal,
      backgroundColor: Colors.teal.withOpacity(.2),
      iconSize: 40,
      padding: padding,
      icon: LineIcons.info,
      textStyle: TextStyle(fontSize: 20),
      text: 'About',
    ));
  }

//add appbar actions
//todo https://api.flutter.dev/flutter/material/AppBar-class.html
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Ocean Group App',
      home: Scaffold(
        extendBody: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            brightness: Brightness.dark,
            title: const Text(
              'Global Ocean Group',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ),
        ),

        body: PageView.builder(
          onPageChanged: (page) {
            setState(() {
              selectedIndex = page;
            });
          },
          controller: controller,
          itemBuilder: (context, position) {
            return Container(
              child: pageNavigator[position],
              color: colors[position],
            );
          },
          itemCount: tabs.length, // Can be null
        ),
        // backgroundColor: Colors.green,
        // body: Container(color: Colors.red,),
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.zero),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: -10,
                      blurRadius: 60,
                      color: Colors.black.withOpacity(.20),
                      offset: Offset(0, 15))
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
              child: GNav(
                  tabs: tabs,
                  selectedIndex: selectedIndex,
                  onTabChange: (index) {
                    print(index);
                    setState(() {
                      selectedIndex = index;
                    });
                    controller.jumpToPage(index);
                  }),
            ),
          ),
        ),
      ),
    );
  }
}


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
    Service(),
    Forum(),
    AboutUs(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Options',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Language dropview'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),

      body: Center(
        child: pageNavigator.elementAt(selectedIndex)
      ),
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
            label: 'News',
          ),
          FFNavigationBarItem(
            iconData: Icons.business_center,
            label: 'Services',
          ),
          FFNavigationBarItem(
            iconData: Icons.forum,
            label: 'Forum',
          ),
          FFNavigationBarItem(
            iconData: Icons.assignment_ind,
            label: 'About Us',
          ),
        ],
      ),
    );
  }
}
