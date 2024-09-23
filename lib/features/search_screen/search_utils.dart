import '../../api/apimanager.dart';
import '../../api/model/Search_response.dart';

class SearchAboutMovie {
  static Future<SearchResponse> searchMovies(String query) {
    return ApiManager.search(query);
  }
}