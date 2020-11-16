// import 'dart:async';
//
// import 'package:global_ocean_group_app/src/network/api_response.dart';
//
// import 'package:global_ocean_group_app/src/network/repository/news_api.dart';
// import 'package:global_ocean_group_app/src/model/news_model.dart';
//
// class NewsBloc {
//   NewsRepository _newsRepository;
//
//   StreamController _newsListController;
//
//   StreamSink<ApiResponse<List<Article>>> get newsListSink =>
//       _newsListController.sink;
//
//   Stream<ApiResponse<List<Article>>> get newsListStream =>
//       _newsListController.stream;
//
//   NewsBloc() {
//     _newsListController = StreamController<ApiResponse<List<Article>>>();
//     _newsRepository = NewsRepository();
//   }
//
//   fetchCategoryNewsList(String newsType) async {
//     newsListSink.add(ApiResponse.loading('Fetching News '));
//     try {
//       List<Article> articles = await _newsRepository.getCategoryNews(newsType);
//       newsListSink.add(ApiResponse.completed(articles));
//     } catch (e) {
//       newsListSink.add(ApiResponse.error(e.toString()));
//       print(e);
//     }
//   }
//
//   fetchTopHeadlinesList() async {
//     newsListSink.add(ApiResponse.loading('Fetching News '));
//     try {
//       List<Article> articles = await _newsRepository.getTopHeadlines();
//       newsListSink.add(ApiResponse.completed(articles));
//     } catch (e) {
//       newsListSink.add(ApiResponse.error(e.toString()));
//       print(e);
//     }
//   }
//
//   dispose() {
//     _newsListController?.close();
//   }
// }
