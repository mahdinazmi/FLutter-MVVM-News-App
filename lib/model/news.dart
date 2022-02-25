class News {

  String ? title;
  String ? publishedAt;
  String ? description;
  String ? url;
  String ? urlToImage;

  News({
    this.title,
    this.publishedAt,
    this.description,
    this.url,
    this.urlToImage
  });


  factory News.fromJson(Map < String, dynamic > json) {
    return News(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      url: json['url'],
      publishedAt: json['publishedAt']
    );
  }
}