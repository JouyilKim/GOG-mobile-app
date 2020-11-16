// class News {
//   String status;
//   int totalResults;
//   List<Article> articles;
//
//   News({
//     this.status,
//     this.totalResults,
//     this.articles,
//   });
//
//   factory News.fromJson(Map<String, dynamic> json) => News(
//     status: json["status"],
//     totalResults: json["totalResults"],
//     articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "totalResults": totalResults,
//     "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
//   };
// }

class Article {
  int activityId;
  String activityTitle;
  String publishDate;
  String activityAuthor;
  String activityContent;
  int categoryId;
  int viewer;
  int activityCategory;

  Article({
    this.activityId,
    this.activityTitle,
    this.publishDate,
    this.activityAuthor,
    this.activityContent,
    this.categoryId,
    this.viewer,
    this.activityCategory,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    activityId: json["activityId"],
    activityTitle: json["activityTitle"],
    publishDate: json["publishDate"],
    activityAuthor: json["activityAuthor"] == null ? null : json["activityAuthor"],
    activityContent: json["activityContect"],
    categoryId: json["categoryId"],
    viewer: json["viewer"],
    activityCategory: json["ActivityCategory"],
  );

  Map<String, dynamic> toJson() => {
    "activityId": activityId,
    "activityTitle": activityTitle,
    "publishDate": publishDate,
    "activityAuthor": activityAuthor == null ? null : activityAuthor,
    "activityContect": activityContent,
    "categoryId": categoryId,
    "viewer": viewer,
    "ActivityCategory": activityCategory,
  };
}
