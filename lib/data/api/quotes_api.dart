import 'package:dio/dio.dart';

import '../../presentation/tools/constants.dart';

class QuotesApi {
  late Dio dio;
  QuotesApi() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: kBaseQuotesUrl, connectTimeout: 4000, receiveTimeout: 5000);
    dio = Dio(baseOptions);
  }

  Future<List<dynamic>> getQuotes(String character) async {
    try {
      Response response = await dio.get("quote?author=$character");
      return response.data;
    } catch (e) {
      return [];
    }
  }
}
