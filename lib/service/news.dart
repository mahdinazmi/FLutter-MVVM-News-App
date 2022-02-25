import 'package:dio/dio.dart';
import 'package:newsapp/constant/constants.dart';
import 'package:newsapp/model/model.dart';

class NewsWebService {

  var dio = Dio();
  
  // Get top head lines
  Future < List < News >> getTopHeadlines() async {

    final response = await dio.get(Constants.TOPHEADLINES);

    // 200 Represent successful response
    if (response.statusCode == 200) {

      final result = response.data;
      
      // Maping result to news model
      Iterable list = result['articles'];
      return list.map((article) => News.fromJson(article)).toList();

    } else {

      throw Exception('response failed');

    }
  }


  // Get news by country key
  Future < List < News >> getNewsByCountry(String country) async {

    final response = await dio.get(Constants.headLiensFor(country));
    
    // 200 Represent successful response
    if (response.statusCode == 200) { 

      final result = response.data;
      
      // Maping result to news model
      Iterable list = result['articles'];
      return list.map((article) => News.fromJson(article)).toList();

    } else {
      throw Exception('response failed');
    }
  }

}