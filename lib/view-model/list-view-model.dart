import 'package:flutter/cupertino.dart';
import 'package:newsapp/model/model.dart';
import 'package:newsapp/service/service.dart';
import 'view-model.dart';

enum LoadingStatus {
  Completed,
  Searching,
  Empty,
}

class ListViewModel with ChangeNotifier {

  LoadingStatus loadingStatus = LoadingStatus.Empty;
  List < ViewModel > viewModels = [];

  // Methods to fetch news
  void fetchTopNewsHeadlines() async {

    List < News > news = await NewsWebService().getTopHeadlines();
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    viewModels = news.map((news) => ViewModel(news: news)).toList();

    if (viewModels.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }
    notifyListeners();
  }



  // Methods for news from each country
  void fetchNewsByCountry(String country) async {

    List < News > news = await NewsWebService().getNewsByCountry(country);
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    viewModels = news.map((article) => ViewModel(news: article)).toList();

    if (viewModels.isEmpty) {
      loadingStatus = LoadingStatus.Empty;
    } else {
      loadingStatus = LoadingStatus.Completed;
    }
    notifyListeners();
  }

}