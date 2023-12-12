import 'package:hcm1011/data/model/info.dart';
import 'package:hcm1011/data/service/api_service.dart';

class ApiRepoList {
  final _provider =
      ListInfoBanner(); // Mengganti ListInfo dengan ApiService atau kelas yang sesuai

  Future<ModelListInfo> fetchDatainfo() {
    throw _provider.fetchDatainfo();
  }
}

class NetworkError extends Error {}
