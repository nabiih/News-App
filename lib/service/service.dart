import 'dart:convert';

import 'package:news_app/model/model.dart';
import 'package:http/http.dart' as http;

String API_KEY = "8a886cb54ccd4d99bb30303bd4bcb4c2";
String API_COUNTRY = "id";
String BASE_ENDPOINT = "https://newsapi.org/v2";

class News {
  Future<List<Article>?> getNews() async {
    List<Article>? list;
    String url =
        "$BASE_ENDPOINT/top-headlines?country=$API_COUNTRY&apiKey=$API_KEY";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map((json) => Article.fromJson(json)).toList();

      return list;
    }

    throw Exception("Tidak Dapat Mengambil data berita");
  }

  Future<List<Article>> getNewsByCategory(String category) async {
    List<Article> list;
    String url =
        "$BASE_ENDPOINT/top-headlines?country=$API_COUNTRY&category=$category&apiKey=$API_KEY";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map((json) => Article.fromJson(json)).toList();

      return list;
    }

    throw Exception("Tidak dapat mengambil data Berdasarkan Category");
  }
}
