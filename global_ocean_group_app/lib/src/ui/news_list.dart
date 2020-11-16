import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:global_ocean_group_app/src/ui/news_details.dart';
import 'package:global_ocean_group_app/src/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsListPage extends StatefulWidget {
  final String title;
  final String newsType;

  NewsListPage(this.title, this.newsType);

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<Article>> getData(String newsType) async {
    List<Article> list;
    String link;
    //TODO: 고칠것
    if (newsType == "top_news") {
      //top news 는 따로 논다
      link = "http://nzisa.fang.co.nz/activity/api?count=20&keyword=";
    } else {
      link =
          "https://newsapi.org/v2/top-headlines?country=in&category=$newsType&apiKey=ae6c3c0f9d8e485a98fd70edcff81134";
    }
    var res = await http.get(Uri.encodeFull(link));
    print(res.body);
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      print("start convert json to list");
      list = data.map<Article>((json) => Article.fromJson(json)).toList();
      print("end of convert");
    }
    print("success!!");
    print("List Size: ${list.length}");
    return list;
  }

  Widget listViewWidget(List<Article> article) {
    return Container(
      child: ListView.builder(
          itemCount: 20,
          padding: const EdgeInsets.all(2.0),
          itemBuilder: (context, position) {
            return Card(
              child: Container(
                height: 120.0,
                width: 120.0,
                child: Center(
                  child: ListTile(
                    title: Text(
                      '${article[position].activityTitle}',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        '${article[position].activityAuthor}',
                      ),
                    ),
                    leading: Container(
                        height: 100.0,
                        width: 100.0,
                        child: Image.asset(
                          'images/news.png',
                          height: 70,
                          width: 70,
                        )),
                    onTap: () => _onTapItem(context, article[position]),
                  ),
                ),
              ),
            );
          }),
    );
  }

  void _onTapItem(BuildContext context, Article article) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => NewsDetails(article, widget.title)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
          future: getData(widget.newsType),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? listViewWidget(snapshot.data)
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}
