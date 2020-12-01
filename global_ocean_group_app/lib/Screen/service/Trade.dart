import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Trade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Comming Soon!\nPlease Contact Us",
          style: TextStyle(
            fontSize: 20,

          ),)
        ],

      ),
    );
  }
}
