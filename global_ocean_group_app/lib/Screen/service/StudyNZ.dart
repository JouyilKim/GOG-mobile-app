import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:global_ocean_group_app/Localization/app_localizations.dart';

import 'Schools.dart';

class StudyNZ extends StatefulWidget {
  @override
  _StudyNZState createState() => _StudyNZState();
}

class _StudyNZState extends State<StudyNZ>
with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.indigoAccent,
              expandedHeight: 200.0,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background:
                  Image.asset("images/studynz1.jpg", fit: BoxFit.cover)
              ),
            ),
          ];
        },

          //******************add Contents here!!!!!!!**********************
          body: SingleChildScrollView(
              child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.fromLTRB(0,20,0,0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                           children:[
                             RaisedButton(
                                 color: Colors.cyan,
                                 splashColor: Colors.deepOrange,
                                 child:
                                 new Text(AppLocalizations.of(context).translate('studyNZ_schools_search'),
                                     overflow: TextOverflow.clip,
                                     style: TextStyle(
                                       fontSize: 18,
                                       fontWeight: FontWeight.bold,
                                     )
                                 ),
                               onPressed: (){
                                 Navigator.push(
                                     context,
                                     MaterialPageRoute(builder: (context) => Schools())
                                 );
                               },
                             )
                           ]
                        )


                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.fromLTRB(20,10,0,0),
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                                child: Text(AppLocalizations.of(context).translate('studyNZ_title'),
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )
                                )
                            )
                          ],
                        )

                    ),

                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(15),
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              //the Texts
                              child: Text(AppLocalizations.of(context).translate('studyNZ_benefits'),
                                overflow: TextOverflow.clip,
                                maxLines: 100,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  letterSpacing: 0.5,
                                  wordSpacing: 1,
                                  fontSize: 15,

                                ),
                              ),
                            )
                          ],
                        )
                    ),


                  ]
              )
          ),

        ),
      ),

    );
  }
}
