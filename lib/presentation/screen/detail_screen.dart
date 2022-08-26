// ignore_for_file: prefer_const_constructors

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walking_dead/busnisse_logic/cubit/quote_cubit.dart';
import 'package:walking_dead/presentation/tools/constants.dart';

import '../../data/model/character.dart';
import '../widget/SliverItem.dart';

class DetailScreen extends StatefulWidget {
  final Character character;
  const DetailScreen({Key? key, required this.character}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var bloc = BlocProvider.of<QuoteCubit>(context);
    bloc.getQuote(widget.character);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TheColors.kGreenLight,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            stretch: true,
            expandedHeight: MediaQuery.of(context).size.height * .7,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 18, bottom: 10),
              title: Text(widget.character.nickname),
              background: Container(
                color: TheColors.kGreenLight,
                child: Hero(
                    tag: widget.character.name,
                    child: Image.network(
                      widget.character.img,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            SliverItem(name: "Name", value: widget.character.name),
            SliverItem(name: "Birthday", value: widget.character.birthday),
            SliverItem(name: "Status", value: widget.character.status),
            SliverItem(name: "Name", value: widget.character.name),
            SliverItem(name: "Birthday", value: widget.character.birthday),
            SliverItem(name: "Status", value: widget.character.status),
            BlocBuilder<QuoteCubit, QuoteState>(
              builder: (context, state) {
                if (state is QuoteLoaded) {
                  return SizedBox(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: Center(
                        child: AnimatedTextKit(
                          animatedTexts: [
                            FlickerAnimatedText(state.quote.quote,
                                textStyle: TextStyle(
                                    color: TheColors.kBlueLight, fontSize: 25)),
                          ],
                          isRepeatingAnimation: true,
                          repeatForever: true,
                        ),
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          ]))
        ],
      ),
    );
  }
}
