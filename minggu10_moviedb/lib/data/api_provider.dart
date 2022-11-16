import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import 'package:minggu10_moviedb/model/popular_movies.dart';

class ApiProvider {
  String apiKey = '';
  String baseUrl = '';

  Client client = Client();

  Future<PopularMovies> getPopularMovies() async {
    // String url = '$baseUrl/movie/popular?api_key=$apiKey';
    // print(url);
    Response response = 
        await client.get('$baseUrl/movie/popular?api_key=$apiKey');
        if (response.statusCode == 200) {
          return PopularMovies.fromJson(jsonDecode(response.body));
        } else {
          throw Exception(response.statusCode);
    }
  }
}