import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Text('News', style: TextStyle(fontSize:40),),
      color: Colors.purpleAccent,
    );
  }
}

