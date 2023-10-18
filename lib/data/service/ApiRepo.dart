import '../model/news.dart';
import 'ApiLogin.dart';

class Network {
  final _provider = Network();

  Future<NewsModel> login() {
    return _provider.login();
  }
}

class NetworkError extends Error {}
