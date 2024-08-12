class ApiConstants {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "?api_key=58f2ec54d1b154ec30b1262cf638f8f3";
  static const String nowPlayingMoviesPath = "$baseUrl/movie/now_playing$apiKey";
  static const String popularMoviesPath = "$baseUrl/movie/popular$apiKey";
  static const String topRatedMoviesPath = "$baseUrl/movie/top_rated$apiKey";


  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String path) => '$baseImageUrl$path';
}