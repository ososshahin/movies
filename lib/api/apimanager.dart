import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/api/model/MoviesDetailsResponse.dart';
import 'package:movies_app/api/model/MoviesListResponse.dart';
import 'package:movies_app/api/model/NewReleasesResponse.dart';
import 'package:movies_app/api/model/PopularMoviesResponse.dart';
import 'package:movies_app/api/model/RecommendedMoviesResponse.dart';
import 'model/Search_response.dart';

class Endpoints {
  static const String popular = '3/movie/popular';
  static const String newReleases = '3/movie/upcoming';
  static const String recommended = '3/movie/top_rated';
  static const String search = '3/search/movie';
  static const String moviesList = '3/genre/movie/list';
  static const String moviesDetails = '3/discover/movie';


}

///////////////////////////////
class ApiManager {
  static const String BASE_URl = 'api.themoviedb.org';
  static const String Authorization_Key =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZmY5NjQxZTkzMDIyMTEzZGVmYzAyYmM4ZmE5YTFjZCIsIm5iZiI6MTcyNjU5OTg4Ny41MDc0OSwic3ViIjoiNjZlOWQxZjk4MmZmODczZjdkMWVlOGJhIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.Oha5G0MpPKfKbtTrD-XBlva3T3f1CS_Qv4HH86DuVr8'; //mohammed
  static const String apiKey = 'e355dd58de7cceb8c05964a6d8fe643e';//donia
  static const String Authorization_key2 =
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMWVkOTU0NjRkZjBkODEyM2MwYTEyMmNmNDM1MmViMyIsIm5iZiI6MTcyNzIwMjc4Mi4wNTIwOTgsInN1YiI6IjY2ZjE3NjYwZGUyZDUyZGZiZDhkMmMyNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.2Q-pbwi-QEKEGmX4oyABVbSX095JMjIY6NArJDU1FqA' ";//mai

  static Future<PopularMoviesResponse> getPopularMovies() async {
    var url = Uri.https(BASE_URl, Endpoints.popular);
    var response =
        await http.get(url, headers: {'Authorization': Authorization_Key});
    var json = jsonDecode(response.body);
    var Popularmovies = PopularMoviesResponse.fromJson(json);
    return Popularmovies;
  }

  /////New Release
  static Future<NewReleasesResponse> getNewReleases() async {
    var url = Uri.https(BASE_URl, Endpoints.newReleases);
    var response =
        await http.get(url, headers: {'Authorization': Authorization_Key});
    var json = jsonDecode(response.body);
    var newReleases = NewReleasesResponse.fromJson(json);
    return newReleases;
  }

  /////Recommended
  static Future<RecommendedMoviesResponse> getRecommended() async {
    var url = Uri.https(BASE_URl, Endpoints.recommended);
    var response =
        await http.get(url, headers: {'Authorization': Authorization_Key});
    var json = jsonDecode(response.body);
    var recommended = RecommendedMoviesResponse.fromJson(json);
    return recommended;
  }

  static Future<MoviesListResponse> getMoviesList() async {
    try {
      // Correctly build the URL with scheme
      var url = Uri.https(BASE_URl, Endpoints.moviesList);
      var response = await http.get(url, headers: {'Authorization': Authorization_Key});

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        var moviesList = MoviesListResponse.fromJson(json);
        return moviesList;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      print('Error in MoviesList API: $e');
      rethrow;
    }
  }

  static Future<MoviesDetails> getMoviesDetails(String genreId) async {
    try {
      var url = Uri.https(BASE_URl, Endpoints.moviesDetails, {'with_genres': genreId}); // Change 'Id' to 'with_genres'
      var response = await http.get(url, headers: {'Authorization': Authorization_Key});
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return MoviesDetails.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load movies: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      print('Error in search API: $e');
      rethrow;
    }
  }

  /////Search
  static Future<SearchResponse> search(String query) async {
   try {
     var url = Uri.https(
         BASE_URl,
         Endpoints.search,
         { "api_key": apiKey, "query": query}
     );
     var response = await http.get(url);
     if (response.statusCode == 200) {
       var json = jsonDecode(response.body);
       var search = SearchResponse.fromJson(json);
       return search;
     } else {
       throw Exception('Failed to load movies');
     }
   }catch (e) {
    print('Error in search API: $e');
    rethrow;
  }
}
}
