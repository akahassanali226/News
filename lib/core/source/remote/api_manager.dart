import 'package:dio/dio.dart';
import 'package:news/models/articles/ArticlesResponse.dart';
import 'package:news/models/responses/SourcesResponse.dart';

class ApiManager {
  static Dio dio = Dio(BaseOptions(baseUrl: "https://newsapi.org"));

  static Future<SourcesResponse> getSources(String category) async {
    var response = await dio.get(
      "/v2/top-headlines/sources",
      queryParameters: {
        "apiKey": "b91930634d704e9f92a90ef8c54eaccd",
        "category": category,
      },
    );
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
    return sourcesResponse;
  }

  static Future<ArticlesResponse> getArticles(String source) async {
    var response = await dio.get(
      "/v2/top-headlines/sources",
      queryParameters: {
        "apiKey": "b91930634d704e9f92a90ef8c54eaccd",
        "sources": source,
      },
    );
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(response.data);
    return articlesResponse;
  }
}
