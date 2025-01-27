import 'package:flutter/material.dart';

import 'package:global_ocean_group_app/NewsLoad/model/categories_model.dart';
import 'news_list.dart';
import 'package:global_ocean_group_app/Localization/app_localizations.dart';

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
      new CategoriesModel(
          'images/info.png', 'important_event', "Important Event"),
      new CategoriesModel(
          'images/study.png', 'local_activity', "Local Activity"),
      new CategoriesModel(
          'images/travel.png', 'study_tour_news', "Study Tour"),
      new CategoriesModel(
          'images/invest.png', 'govt_activity', "Govnt Activity"),
      new CategoriesModel(
          'images/dialogs.png', 'social_activity', "Socially Activity"),

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
        children: List.generate(5, (index) {
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
                      AppLocalizations.of(context).translate(categoriesList[index].title),
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
