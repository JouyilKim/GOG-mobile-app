import 'package:flutter/material.dart';

import 'package:global_ocean_group_app/NewsLoad/model/news_model.dart';
import 'package:flutter_html/flutter_html.dart';


class NewsDetails extends StatefulWidget {
  final Article article;
  final String title;

  NewsDetails(this.article, this.title);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset('images/nz.png'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.article.activityTitle,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.all(10),
                      child:Text("Viewers: "+ widget.article.viewer.toString()),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Html(
                      data: widget.article.activityContent,
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
