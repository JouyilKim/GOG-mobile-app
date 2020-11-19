import 'package:global_ocean_group_app/NewsLoad/model/news_model.dart';

abstract class INewsAPi {
  Future<List<Article>> getCategoryNews(String newsType);

  Future<List<Article>> getTopHeadlines();
}
