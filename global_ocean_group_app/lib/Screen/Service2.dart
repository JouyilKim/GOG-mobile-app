import 'package:flutter/material.dart';
import 'package:global_ocean_group_app/Localization/app_localizations.dart';


class Service2 extends StatefulWidget {
  @override
  _Service2State createState() => _Service2State();
}

class _Service2State extends State<Service2> {
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
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
                Tab(text: AppLocalizations.of(context).translate('investment'), icon: Icon(Icons.search)),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff5808e5),

        ),
        body: TabBarView(
          children: [
            Center(child: Text('Study in NZ')),
            Center(child: Text('Study Tour')),
            Center(child: Text(myLocale.toString())),
          ],
        ),
      ),
    );

  }
}
