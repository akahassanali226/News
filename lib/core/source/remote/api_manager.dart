import 'package:dio/dio.dart';
import 'package:news/models/responses/SourcesResponse.dart';

class ApiManager {
  static Dio dio = Dio(BaseOptions(baseUrl: "https://newsapi.org"));

  static getSources(String category) async{
    try{
      var response =await dio.get(
        "/v2/top-headlines/sources",
        queryParameters: {
          "apiKey": "b91930634d704e9f92a90ef8c54eaccd",
          "category": category,
        },
      );
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(response.data);
      return sourcesResponse;
    }catch(e){
      print(e.toString());
    }

  }
}
