class Article {
  String url;
  Source source;
  int activityId;
  String activityTitle;
  DateTime publishDate;
  String activityAuthor;
  String activityContent;
  int categoryId;
  int viewer;
  String ActivityCategory;

  Article(
      {
        this.url,
        this.source,
        this.activityId,
        this.activityTitle,
        this.publishDate,
        this.activityAuthor,
        this.activityContent,
        this.categoryId,
        this.viewer,
        this.ActivityCategory,
      });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        source: Source.fromJson(json["source"]),
        activityId: json["activityId"],
        activityTitle: json["activityTitle"],
        publishDate: json["publishDate"],
        activityAuthor: json["activityAuthor"],
        activityContent: json["activityContect"],
        categoryId: json["categoryId"],
        viewer: json["viewer"],
        ActivityCategory: json["ActivityCategory"],
    );
  }
}

class Source {
  String id;
  String name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json["id"] as String,
      name: json["name"] as String,
    );
  }
}