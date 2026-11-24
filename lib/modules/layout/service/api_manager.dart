import 'package:movies/core/services/api_service.dart';
import 'package:movies/modules/layout/modals/movie_details_response.dart';

import '../modals/movie_response.dart';

class ApiManager {

  static Future<List<Movies>?> getMovies() async{
    try {
      var response = await ApiService.dio.get("list_movies.json?query_term=2026");
      if(response.statusCode == 200) {
        var data = MovieResponse.fromJson(response.data);
        return data.data?.movies??[];
      }
      else {
        throw response.statusMessage??"";
      }
    } catch(e) {
      rethrow;
    }
  }
  
  
  static Future<Movie?> getMovieDetails(num movieId) async{
    try {
      var response = await ApiService.dio.get("movie_details.json?movie_id=$movieId");
      if(response.statusCode == 200) {
        var data = MovieDetailsResponse.fromJson(response.data);
        return data.data?.movie;
      }
      else {
        throw response.statusMessage??"";
      }
    } 
    catch(e) {
      rethrow;
    }
  }
  
  
  static Future<List<Movies>?> getSearch(String searchText) async{
    try {
      var response = await ApiService.dio.get("/list_movies.json?query_term=$searchText");
      if(response.statusCode == 200) {
        var data = MovieResponse.fromJson(response.data);
        return data.data?.movies;
      } else {
        throw response.statusMessage??"";
      }
    } catch(e) {
      rethrow;
    }
  }


  static Future<List<Movies>?> getGenreMovies(String genre) async{
    try {
      var response = await ApiService.dio.get("/list_movies.json?genre=$genre");
      if(response.statusCode == 200) {
        var data = MovieResponse.fromJson(response.data);
        return data.data?.movies;
      } else {
        throw response.statusMessage??"";
      }
    } catch(e) {
      rethrow;
    }
  }
}