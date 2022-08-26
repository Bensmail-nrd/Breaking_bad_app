// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walking_dead/busnisse_logic/cubit/characters_cubit.dart';
import 'package:walking_dead/busnisse_logic/cubit/quote_cubit.dart';
import 'package:walking_dead/data/api/characters_api.dart';
import 'package:walking_dead/data/respository/characters_repository.dart';
import 'package:walking_dead/presentation/screen/detail_screen.dart';
import 'package:walking_dead/presentation/tools/constants.dart';

import '../../data/model/character.dart';
import '../screen/characters_screen.dart';

class RouteGenerator {
  late CharactersRepository _charactersRepository;
  late CharactersCubit _charactersCubit;

  RouteGenerator() {
    _charactersRepository = CharactersRepository(CharactersApi());
    _charactersCubit = CharactersCubit(_charactersRepository);
  }

  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case kCharactersScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => _charactersCubit,
            child: CharactersScreen(),
          ),
        );
      case kCharacterDetailsScreenRoute:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            final Character character = settings.arguments as Character;
            return BlocProvider(
              create: (context) => QuoteCubit(),
              child: DetailScreen(
                character: character,
              ),
            );
          },
        );
    }
    return null;
  }
}
