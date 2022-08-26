import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:walking_dead/data/respository/characters_repository.dart';

import '../../data/model/character.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  late CharactersRepository charactersRespository;
  List<Character> characters = [];
  CharactersCubit(this.charactersRespository) : super(CharactersInitial());

  void getAllCharacters() {
    charactersRespository.getAllCharacters().then((character) {
      emit(CharactersLoaded(character));
      this.characters = character;
    });
  }

  void searchChanged() {
    emit(CharactersLoaded(this.characters));
  }
}
