class CharacterQuotes {
  late String quote;

  CharacterQuotes.fromJson(Map<String, dynamic> json) {
    quote = json['quote'];
  }
}
