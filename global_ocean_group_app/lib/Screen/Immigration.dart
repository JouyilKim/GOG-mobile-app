import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_ocean_group_app/Localization/app_localizations.dart';
import 'package:global_ocean_group_app/Screen/Wage.dart';
import 'Calc.dart';
import 'Wage.dart';

class Immigration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child:
              Text(AppLocalizations.of(context).translate('immigration_def'),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                )
              )
          ),
          Padding(padding: EdgeInsets.all(10)),

          new RaisedButton(
              color: Colors.teal,
              child:
              new Text(
                AppLocalizations.of(context).translate('go_calc'),
                style: new TextStyle(fontSize:24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Roboto"),
              ),
            onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Calc())
                );
            },
          ),
          Padding(padding: EdgeInsets.all(10)),

          new RaisedButton(
            color: Colors.teal,
            child:
            new Text(
              AppLocalizations.of(context).translate('go_wage'),
              style: new TextStyle(fontSize:24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto"),
            ),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WagePage())
              );
            },
          ),
        ],
      ),

    );
  }

}
