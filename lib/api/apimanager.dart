import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/api/model/NewReleasesResponse.dart';
import 'package:movies_app/api/model/PopularMoviesResponse.dart';
import 'package:movies_app/api/model/RecommendedMoviesResponse.dart';

import 'model/Movie.dart';
class Endpoints{
  String popular = '3/movie/popular';
  String NewReleases = '3/movie/upcoming';
  String Recommended = '3/movie/top_rated';
}
class ApiManager {
  String BASE_URl = 'api.themoviedb.org';
  String Authorization_Key = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0ZmY5NjQxZTkzMDIyMTEzZGVmYzAyYmM4ZmE5YTFjZCIsIm5iZiI6MTcyNjU5OTg4Ny41MDc0OSwic3ViIjoiNjZlOWQxZjk4MmZmODczZjdkMWVlOGJhIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.Oha5G0MpPKfKbtTrD-XBlva3T3f1CS_Qv4HH86DuVr8';
  Future<PopularMoviesResponse>getPopularMovies()async{
    var url = Uri.https(BASE_URl,Endpoints().popular);
    var response=  await http.get(url,  headers: { 'Authorization':Authorization_Key});
    var json = jsonDecode(response.body);
    var Popularmovies= PopularMoviesResponse.fromJson(json);
    return Popularmovies;
  }
  Future<NewReleasesResponse>getNewReleases()async{
    var url = Uri.https(BASE_URl,Endpoints().NewReleases);
    var response=  await http.get(url,  headers: { 'Authorization':Authorization_Key});
    var json = jsonDecode(response.body);
    var newReleases= NewReleasesResponse.fromJson(json);
    return newReleases;
  }
Future<RecommendedMoviesResponse>getRecommended()async{
    var url = Uri.https(BASE_URl,Endpoints().Recommended);
    var response=  await http.get(url,  headers: { 'Authorization':Authorization_Key});
    var json = jsonDecode(response.body);
    var recommended= RecommendedMoviesResponse.fromJson(json);
    return recommended;
  }

}
