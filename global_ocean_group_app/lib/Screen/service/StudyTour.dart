import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:global_ocean_group_app/Localization/app_localizations.dart';

class StudyTour extends StatefulWidget {
  @override
  _StudyTourState createState() => _StudyTourState();
}

class _StudyTourState extends State<StudyTour>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }
  
  /*
  /the silver app bar
  /project supported by Medium open source
  https://medium.com/@diegoveloper/flutter-collapsing-toolbar-sliver-app-bar-14b858e87abe
   */
  @override
  Widget build(BuildContext context)  {

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
                    Image.asset("images/studytour.jpg", fit: BoxFit.cover)
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
                        alignment: Alignment.topLeft,
                          padding: const EdgeInsets.fromLTRB(20,10,0,0),
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                  child: Text(AppLocalizations.of(context).translate('what_is_study_tour'),
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
                                    child: Text(AppLocalizations.of(context).translate('study_tour_def'),
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
                       Container(
                         child: Image.asset("images/travelnz.jpg", ),
                       ),

                       Container(
                         padding: const EdgeInsets.all(5),
                         child: Card(
                           color: Colors.lightGreen,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisSize: MainAxisSize.max,
                             children: [
                               Row(
                                 children: [
                                   Text(AppLocalizations.of(context).translate('benefits_of_study_tour'),
                                     style: TextStyle(
                                       fontSize: 17,
                                       fontWeight: FontWeight.bold,
                                       color: Colors.pink,

                                     )),
                                 ],
                               ),
                               Row(
                                 children: [
                                   Image.asset("images/book1.png",
                                     width: 50,height: 50,),
                                   Expanded(
                                     child:Text(AppLocalizations.of(context).translate('improve_lang_skill')),
                                   ),
                                   Image.asset("images/insight.png",
                                     width: 50,height: 50,),
                                   Expanded(
                                     child:Text(AppLocalizations.of(context).translate('expand_vision'))
                                   ),
                                 ],
                               ),
                               Row(
                                 children: [
                                   Image.asset("images/puzzle.png",
                                     width: 50, height: 50,),
                                   Expanded(
                                     child: Text(AppLocalizations.of(context).translate('independent_res')),
                                   ),
                                   Image.asset("images/dialogs.png",
                                     width: 50, height: 50,),
                                   Expanded(
                                     child:Text(AppLocalizations.of(context).translate('multi-culture'))
                                   ),
                                 ],
                               )
                             ],
                           ),

                         ),
                       ),

                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Text(AppLocalizations.of(context).translate('what_we_can_provide'),
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              //the Texts
                              child: Text(AppLocalizations.of(context).translate('gog_study_tour'),
                                overflow: TextOverflow.clip,
                                maxLines: 100,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  letterSpacing: 0.5,
                                  wordSpacing: 1.2,
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
