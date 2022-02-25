import 'package:intl/intl.dart';
import 'package:newsapp/model/model.dart';

class ViewModel {
  News news;
  ViewModel({ News ? news }): news = news!;

  String ? get title {
    return news.title;
  }

  String ? get description {
    return news.description;
  }

  String ? get url {
    return news.url;
  }

  String ? get urlToImage {
    return news.urlToImage;
  }

  String ? get publishedAt {
    final dateTime = DateFormat('yyyy-mm-ddTHH:mm:ssZ').parse(news.publishedAt!, true);
    return DateFormat.yMMMMEEEEd('en-us').format(dateTime);
  }

}