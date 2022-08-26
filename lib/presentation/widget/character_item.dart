import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walking_dead/data/model/character.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/details", arguments: character);
      },
      child: Container(
        foregroundDecoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: GridTile(
          footer: Container(
            padding: const EdgeInsets.only(left: 8),
            alignment: Alignment.centerLeft,
            height: 30,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black87, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
            child: Text(
              character.name,
              style: GoogleFonts.aclonica(color: Colors.white),
            ),
          ),
          child: Hero(
            tag: character.name,
            child: FadeInImage(
                image: NetworkImage(character.img),
                fit: BoxFit.cover,
                placeholder: const AssetImage("assets/loadinga.gif")),
          ),
        ),
      ),
    );
  }
}
