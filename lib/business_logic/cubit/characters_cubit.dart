import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/character_quotes.dart';
import '../../data/models/characters.dart';
import '../../data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;

  List<Character> characters = [];
  List<CharacterQuotes> quotes = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacter().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }

  void getCharacterQuotes(String characterQuotes) {
    charactersRepository.getCharacterQuotes(characterQuotes).then((quotes) {
      emit(QuotesLoaded(quotes));
    });
  }
}