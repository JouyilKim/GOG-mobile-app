import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
  //project supported by Medium open source
  https://medium.com/@diegoveloper/flutter-collapsing-toolbar-sliver-app-bar-14b858e87abe
   */
  @override
  Widget build(BuildContext context)  {

    //Texts
    final studyTourIntro = '    Study tour is between the study and tour.'
        ' It is a traditional way of learning and education in many countries and civilizations.  '
        'The story in the Bible which says five oriental scholars congratulate the birth of Jesus Christ, and also the experience of Italian Marco Polo in China, have revealed abundant information about how ancient eastern and western world communicate via study tour. '
        'In China, study tour has been playing a very important role in personality formation even from ancient times.   '
        'There is a Chinese old saying, “read ten thousand books and travel ten thousand miles”, reading great books while doing great travels is a long-held and well-known Chinese tradition.';
    final provide = "Global Ocean Group has own high-end tourism, culture and education resources in both North and South Island in New Zealand, and its range of business also covers international trade, real estate development and a variety of business activities. "
        "As a local company, Global Ocean Group has a unique in-depth knowledge about New Zealand tourism resources, which makes it possible to provide high-quality New Zealand journey for customers from all around the world. "
        "Our tourism service is guaranteed by Tourism New Zealand. It is our duty to make you enjoy the beauty and magic that this paradise can give.\n\n\n"
        "Global Ocean Group has abundant and extensive sailing yacht resources and is devoted to establishing an international platform for high-quality consultant and communication. "
        "We have the most advantage of travel services and tourism experts, with which our customers can enjoy the convenient and honourable trip in the customized personal journey. "
        "We have even more projects with New Zealand features (like, fishing, golf, skiing, step by road, etc.) to improve traveller’s experience as well.";

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
                          child:Flexible(
                              child: Text("What is Study Tour?",
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )
                              )
                          )
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              child: Expanded(
                                //the Texts
                                child: Text(studyTourIntro,
                                overflow: TextOverflow.clip,
                                maxLines: 100,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    letterSpacing: 0.5,
                                    wordSpacing: 1,
                                    fontSize: 15,

                                  ),
                                ),
                              ))

                        ],
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
                                   Text("Benefits of Study & Tour"),
                                 ],
                               ),
                               Row(
                                 children: [
                                   Image.asset("images/book1.png",
                                     width: 50,height: 50,),
                                   Expanded(
                                     child:Text("Improve Language Skills"),
                                   ),
                                   Image.asset("images/insight.png",
                                     width: 50,height: 50,),
                                   Expanded(
                                     child:Text(" Expand Visions")
                                   ),
                                 ],
                               ),
                               Row(
                                 children: [
                                   Image.asset("images/puzzle.png",
                                     width: 50, height: 50,),
                                   Expanded(
                                     child: Text("Cultivate Independent\nResponsibilities"),
                                   ),
                                   Image.asset("images/dialogs.png",
                                     width: 50, height: 50,),
                                   Expanded(
                                     child:Text("Experience\nMulti-culture")
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
                        child: Text("What We Can Provide",
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                      Container(
                        child: Flexible(
                          //the Texts
                          child: Text(provide,
                            overflow: TextOverflow.clip,
                            maxLines: 100,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              letterSpacing: 0.5,
                              wordSpacing: 1,
                              fontSize: 15,
                            ),
                          ),
                        )),
                    ]
              )
          ),

        ),
      ),
    );
  }
}
