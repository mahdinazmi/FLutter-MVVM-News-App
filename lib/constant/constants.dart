class Constants {

  // Top head lines URL
  static const APIKEY = "52489cf346804f2eb180b8e34528aa26";
  static const TOPHEADLINES = "https://newsapi.org/v2/top-headlines?country=us&apiKey=$APIKEY";
 
  // Top head lines for a specific country URL
  static String headLiensFor(String country) {
    return 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$APIKEY';
  }

  // Countries keyes
  static const Map < String, String > COUNTRIES = {
    'USA': 'us',
    'India': 'in',
    'Korea': 'kr',
    'China': 'cn'
  };

}