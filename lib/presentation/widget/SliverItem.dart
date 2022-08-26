import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:walking_dead/presentation/tools/constants.dart';

class SliverItem extends StatelessWidget {
  const SliverItem({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  final String name;
  final dynamic value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 12),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: TheColors.kBlueLight))),
            child: Text(
              "$name : ",
              style:
                  GoogleFonts.aladin(color: TheColors.kBlueLight, fontSize: 22),
            ),
          ),
          Text(
            value.toString(),
            style: GoogleFonts.aladin(fontSize: 22, color: TheColors.kGreen),
          )
        ],
      ),
    );
  }
}
