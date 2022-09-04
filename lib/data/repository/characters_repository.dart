import '../web_services/characters_web_services.dart';

import '../models/character_quotes.dart';
import '../models/characters.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository(this.charactersWebServices);

  Future<List<Character>> getAllCharacter() async {
    final characters = await charactersWebServices.getAllCharacter();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }

  Future<List<CharacterQuotes>> getCharacterQuotes(
      String characterQuote) async {
    final characterQuotes =
        await charactersWebServices.getCharacterQuotes(characterQuote);
    return characterQuotes
        .map((quote) => CharacterQuotes.fromJson(quote))
        .toList();
  }
}
