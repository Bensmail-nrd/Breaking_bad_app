part of 'quote_cubit.dart';

@immutable
abstract class QuoteState {}

class QuoteInitial extends QuoteState {}

class QuoteLoaded extends QuoteState {
  Quote quote;

  QuoteLoaded(this.quote);
}
