import 'package:flutter/material.dart';
import 'package:global_ocean_group_app/Localization/app_localizations.dart';

import 'package:global_ocean_group_app/Screen/service/StudyNZ.dart';
import 'package:global_ocean_group_app/Screen/service/StudyTour.dart';


class Service extends StatefulWidget {
  @override
  _ServiceState createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          flexibleSpace: SafeArea(
            child: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: AppLocalizations.of(context).translate('study_in_NZ'), icon: Icon(Icons.menu_book)),
                Tab(text: AppLocalizations.of(context).translate('study_tour'), icon: Icon(Icons.airplanemode_active)),
                Tab(text: AppLocalizations.of(context).translate('trade'), icon: Icon(Icons.work_sharp)),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.indigoAccent,

        ),
        body: TabBarView(
          children: [
            Center(child: StudyNZ()),
            Center(child: StudyTour()),
            Center(child: Text("todo")),
          ],
        ),
      ),
    );

  }
}
