import 'package:flutter/material.dart';

import 'package:global_ocean_group_app/NewsLoad/model/categories_model.dart';
import 'news_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoriesModel> categoriesList;

  @override
  void initState() {
    categoriesList = new List<CategoriesModel>();
    categoriesList = loadCategories();
    super.initState();
  }

  List<CategoriesModel> loadCategories() {
    var categories = <CategoriesModel>[
      //adding all the categories of news in the list
      new CategoriesModel('images/study.png', "Study in NZ", "top_news"),
      new CategoriesModel('images/travel.png', "Study & Tour", "health"),
      new CategoriesModel(
          'images/invest.png', "Investment", "entertainment"),
      new CategoriesModel('images/invest.png', "Sports", "sports"),
      // new CategoriesModel('images/business_news.png', "Business", "business"),
      // new CategoriesModel('images/tech_news.png', "Technology", "technology"),
      // new CategoriesModel('images/science_news.png', "Science", "science"),
      // new CategoriesModel('images/politics_news.png', "Politics", "politics")
    ];
    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this would produce 2 rows.
        crossAxisCount: 2,
        // Generate 100 Widgets that display their index in the List
        children: List.generate(4, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Colors.white,elevation: 1.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0)),
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage(categoriesList[index].image),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      categoriesList[index].title,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => NewsListPage(
                        categoriesList[index].title,
                        categoriesList[index].newsType)));
              },
            ),
          );
        }),
      ),
    );
  }
}
