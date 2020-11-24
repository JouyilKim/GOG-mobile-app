import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:global_ocean_group_app/Localization/app_localizations.dart';
import 'package:global_ocean_group_app/NewsLoad/ui/news_details.dart';
import 'package:global_ocean_group_app/NewsLoad/model/news_model.dart';
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

  Future<List<Article>> getData() async {
    List<Article> list; //articles to return to UI
    String link;
      link = "http://nzisa.fang.co.nz/activity/api?count=100&keyword=";

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
    list = await articleSelector(list);
    print("article select success");
    print("List Size: ${list.length}");
    return list;
  }

  Widget listViewWidget(List<Article> article) {

    return Container(
      child: ListView.builder(
          itemCount: article.length,
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

  //return if article is correct
  Future<List<Article>> articleSelector(List<Article> article) async{

    //article type to numbers
    int type;
    if(widget.newsType=="Local Activity")
      type = 1;
    else if(widget.newsType=="Study Tour")
      type = 2;
    else if(widget.newsType=="Govnt Activity")
      type = 3;
    else if(widget.newsType=="Socially Activity")
      type = 4;
    else if(widget.newsType=="Important Event")
      type = 5;

    List<Article> newArticle = <Article>[];

    // int count =0;
    for(int i = 0; i<article.length;i++){
      if(article[i].categoryId==type){
        newArticle.add(article[i]);
        // count++;
      }
    }
    return newArticle;
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
        title: Text(AppLocalizations.of(context).translate(widget.title)),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? listViewWidget(snapshot.data)
                : Center(child: CircularProgressIndicator());
          }),
    );
  }
}
