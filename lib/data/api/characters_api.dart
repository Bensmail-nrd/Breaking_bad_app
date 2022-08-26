import 'package:dio/dio.dart';
import 'package:walking_dead/presentation/tools/constants.dart';

class CharactersApi {
  late Dio dio;
  CharactersApi() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: kBaseUrl, connectTimeout: 4000, receiveTimeout: 5000);
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get("characters");
      return response.data;
    } catch (e) {
      print("Nouredine" + e.toString());
      return [];
    }
  }
}
