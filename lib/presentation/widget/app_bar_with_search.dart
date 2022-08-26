import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walking_dead/busnisse_logic/cubit/characters_cubit.dart';
import 'package:walking_dead/presentation/tools/constants.dart';

class AppBarWithSearch extends StatefulWidget {
  final TextEditingController textEditingController;
  const AppBarWithSearch({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  State<AppBarWithSearch> createState() => _AppBarWithSearchState();
}

class _AppBarWithSearchState extends State<AppBarWithSearch> {
  bool isSearch = false;

  CrossFadeState crossFadeState = CrossFadeState.showFirst;
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CharactersCubit>(context);
    return AnimatedCrossFade(
        firstChild: Container(
          margin: const EdgeInsets.all(0),
          child: Row(
            children: [
              const Expanded(
                flex: 8,
                child: Text(
                  "Characters",
                  style: TextStyle(color: TheColors.kBlue),
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.textEditingController.clear();
                      crossFadeState = CrossFadeState.showSecond;
                    });
                  },
                  icon: const Icon(
                    Icons.search,
                    color: TheColors.kBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
        secondChild: Container(
          margin: const EdgeInsets.all(0),
          child: Row(
            children: [
              Expanded(
                flex: 8,
                child: TextField(
                  onChanged: (value) {
                    bloc.searchChanged();
                  },
                  controller: widget.textEditingController,
                  decoration: const InputDecoration(
                      hintText: "Find Character ...",
                      hintStyle: TextStyle(color: TheColors.kBlue)),
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.textEditingController.clear();
                      crossFadeState = CrossFadeState.showFirst;
                      bloc.searchChanged();
                    });
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: TheColors.kBlue,
                  ),
                ),
              ),
            ],
          ),
        ),
        crossFadeState: crossFadeState,
        duration: const Duration(milliseconds: 500));
  }
}
