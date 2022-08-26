// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walking_dead/busnisse_logic/cubit/characters_cubit.dart';
import 'package:walking_dead/data/model/character.dart';
import 'package:walking_dead/presentation/tools/constants.dart';
import 'package:walking_dead/presentation/widget/app_bar_with_search.dart';
import 'package:walking_dead/presentation/widget/characters_grid_builder.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List<Character> allCharacters = [];
  List<Character> searchedCharacters = [];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Scaffold(
      backgroundColor: TheColors.kBlueLight,
      appBar: AppBar(
          backgroundColor: TheColors.kGreenLight,
          title: AppBarWithSearch(
            textEditingController: textController,
          )),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoaded) {
            allCharacters = state.character;
            if (textController.text.isNotEmpty) {
              searchedCharacters = allCharacters
                  .where((element) => element.name
                      .toLowerCase()
                      .startsWith(textController.text.toLowerCase()))
                  .toList();
            } else {
              searchedCharacters = allCharacters.toList();
            }
            return CharactersGridBuilder(allCharacters: searchedCharacters);
          } else {
            return Center(
              child: Image.asset("assets/loadinga.gif"),
            );
          }
        },
      ),
    );
  }
}
