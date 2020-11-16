import 'package:flutter/material.dart';
import 'Calc.dart';

class Service extends StatefulWidget {
  @override
  _SilverAppBarWithTabBarState createState() => _SilverAppBarWithTabBarState();
}

class _SilverAppBarWithTabBarState extends State<Service>
    with SingleTickerProviderStateMixin {

  TabController controller;
  List<Widget> containers =[
    Container(

    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      child: Calc(),
    )
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          //https://github.com/flutter/plugins/tree/master/packages/webview_flutter#using-hybrid-composition
          SliverAppBar(
            pinned: false,
            snap: false,
            floating: false,
            backgroundColor: Colors.deepOrange,
            // **Is it intended ?** flexibleSpace.title overlaps with tabs title.
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.airplanemode_active), text: "Study Tour",),
                Tab(icon: Icon(Icons.assignment), text:"Study" ,),
                Tab(icon: Icon(Icons.score), text: "Immigration",),
              ],
              controller: controller,
            ),
          ),
          // SliverList(
          SliverFillRemaining(
            child: TabBarView(
              //physics: NeverScrollableScrollPhysics(),
              controller: controller,
              children: containers,
            ),
          ),
        ],
      ),
    );
  }
}