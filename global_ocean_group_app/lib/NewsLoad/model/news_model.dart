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
