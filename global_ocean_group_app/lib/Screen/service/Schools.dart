import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:global_ocean_group_app/Localization/app_localizations.dart';

class Schools extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('studyNZ_schools')),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              alignment: Alignment.topCenter,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                      child: Text(
                          AppLocalizations.of(context)
                              .translate('studyNZ_schools_def'),
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )))
                ],
              ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0),),
            Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.all(10),
                color: Colors.blueAccent,
                child: Text(
                    AppLocalizations.of(context).translate('studyNZ_8Unis'),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ))),
            Container(
              padding: const EdgeInsets.all(13),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                          child: Text("1."+
                              AppLocalizations.of(context).translate('AUT'),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )))
                    ],
                  ),
                  Image.asset("images/Unis/AUT.jpg"),
                  Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),

                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                          child: Text("2."+
                              AppLocalizations.of(context).translate('UA'),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )))
                    ],
                  ),
                  Image.asset("images/Unis/UA1.jpg"),
                  Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
                  Image.asset("images/Unis/UA2.jpg"),
                  Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),

                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                          child: Text("3."+
                              AppLocalizations.of(context).translate('UC'),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )))
                    ],
                  ),
                  Image.asset("images/Unis/Canterbury.jpg"),
                  Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),

                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                          child: Text("4."+
                              AppLocalizations.of(context).translate('LU'),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )))
                    ],
                  ),
                  Image.asset("images/Unis/Lincoln.jpg"),
                  Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),

                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                          child: Text("5."+
                              AppLocalizations.of(context).translate('MU'),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )))
                    ],
                  ),
                  Image.asset("images/Unis/Massey.jpg"),
                  Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),

                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                          child: Text("6."+
                              AppLocalizations.of(context).translate('MUW'),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )))
                    ],
                  ),
                  Image.asset("images/Unis/Massey Wellington.jpg"),
                  Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),

                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                          child: Text("6."+
                              AppLocalizations.of(context).translate('UO'),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )))
                    ],
                  ),
                  Image.asset("images/Unis/Otago.jpg"),
                  Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),

                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                          child: Text("7."+
                              AppLocalizations.of(context).translate('VUW'),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )))
                    ],
                  ),
                  Image.asset("images/Unis/Victoria.jpg"),
                  Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),

                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                          child: Text("8."+
                              AppLocalizations.of(context).translate('UW'),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )))
                    ],
                  ),
                  Image.asset("images/Unis/Waikato.jpg"),
                  Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
