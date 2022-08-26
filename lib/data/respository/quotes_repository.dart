import 'package:walking_dead/data/api/quotes_api.dart';

import '../model/character.dart';
import '../model/quote.dart';

class QuotesRepository {
  final QuotesApi quotesApi;
  final Character character;

  QuotesRepository(this.quotesApi, this.character);

  Future<List<Quote>> getQuotes() async {
    List response =
        await quotesApi.getQuotes("${character.name.replaceAll(" ", "+")}");
    return response.map((e) => Quote.fromJson(e)).toList();
  }
}
