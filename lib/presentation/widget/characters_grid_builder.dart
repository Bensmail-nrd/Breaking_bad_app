import 'package:flutter/material.dart';
import 'package:walking_dead/data/model/character.dart';
import 'package:walking_dead/presentation/widget/character_item.dart';

class CharactersGridBuilder extends StatelessWidget {
  const CharactersGridBuilder({
    Key? key,
    required this.allCharacters,
  }) : super(key: key);

  final List<Character>? allCharacters;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          childAspectRatio: 0.8,
          crossAxisSpacing: 15),
      shrinkWrap: true,
      itemCount: allCharacters!.length,
      itemBuilder: (BuildContext context, int index) {
        return CharacterItem(
          character: allCharacters![index],
        );
      },
    );
  }
}
