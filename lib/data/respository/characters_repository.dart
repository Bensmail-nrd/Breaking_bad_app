import 'package:walking_dead/data/api/characters_api.dart';
import 'package:walking_dead/data/model/character.dart';

class CharactersRepository {
  final CharactersApi charactersApi;

  CharactersRepository(this.charactersApi);

  Future<List<Character>> getAllCharacters() async {
    List response = await charactersApi.getAllCharacters();
    return response.map((e) => Character.fromJson(e)).toList();
  }
}
