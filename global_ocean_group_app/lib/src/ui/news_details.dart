import 'package:flutter/material.dart';

import 'package:global_ocean_group_app/src/model/news_model.dart';
import 'package:global_ocean_group_app/src/ui/web_view.dart';
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Html(
                      data: widget.article.activityContent,
                    ),
                    // Text(
                    //   widget.article.activityContent,
                    //   style: TextStyle(fontSize: 19.0),
                    // ),
                  )
                ],
              ),
              // MaterialButton(
              //   height: 50.0,
              //   color: Colors.grey,
              //   child: Text(
              //     "For more news",
              //     style: TextStyle(color: Colors.white, fontSize: 18.0),
              //   ),
              //   onPressed: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (BuildContext context) =>
              //             WebView(widget.article.url)));
              //   },
              // )
            ],
          ),
        ));
  }
}
