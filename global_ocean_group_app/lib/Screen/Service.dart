import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  TabController tabController;


  void initState() {

  }
//todo https://android.jlelse.eu/flutter-bubble-tab-indicator-for-tabbar-dd038f1076d3
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: Size(20, 10),
              child: TabBar(
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 5),
                  insets: EdgeInsets.symmetric(horizontal: 16)
                ),
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ],
              ),
            ),
          ),
        body:
        TabBarView(
          children: [
            Icon(Icons.comment),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    ),
    );
  }
}

/*
import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Text('Service', style: TextStyle(fontSize:40),),
      color: Colors.teal,
    );
  }
}
 */
