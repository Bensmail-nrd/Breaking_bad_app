class Quote {
  late String quote;
  Quote(this.quote);
  Quote.fromJson(Map json) {
    quote = json["quote"];
  }
}
