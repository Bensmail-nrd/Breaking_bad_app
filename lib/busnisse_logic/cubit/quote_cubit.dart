import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:walking_dead/data/api/quotes_api.dart';
import 'package:walking_dead/data/model/character.dart';
import 'package:walking_dead/data/respository/quotes_repository.dart';

import '../../data/model/quote.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  QuoteCubit() : super(QuoteInitial());
  Future<void> getQuote(Character character) async {
    List<Quote> quotes =
        await QuotesRepository(QuotesApi(), character).getQuotes();
    if (quotes.isNotEmpty) {
      emit(QuoteLoaded(quotes[Random().nextInt(quotes.length - 1)]));
    } else {
      emit(QuoteLoaded(Quote("Said Nothing")));
    }
  }
}
