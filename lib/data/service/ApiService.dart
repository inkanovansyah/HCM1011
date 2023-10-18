import 'package:dio/dio.dart';
import '../model/info.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url =
      'https://newsapi.org/v2/top-headlines?country=id&apiKey=4a43170566104288a545166117412adc';

  Future<NewsModel> fetchArticleList() async {
    try {
      Response response = await _dio.get(_url); // URL sudah menggunakan HTTPS
      if (response.statusCode == 200) {
        return NewsModel.fromJson(response.data);
      } else {
        throw Exception(
            "Failed to load data. Status code: ${response.statusCode}");
      }
    } catch (error, stacktrace) {
      print("Exception occurred: $error\nStackTrace: $stacktrace");
      throw Exception("Failed to load data. Check your network connection.");
    }
  }
}

// class Apilogin {
//   var dio = Dio();
//   Future<LoginModel> fatchLogin() 
// }
