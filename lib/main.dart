// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:walking_dead/presentation/tools/route_generator.dart';

void main() {
  runApp(WalkingDead());
}

class WalkingDead extends StatelessWidget {
  WalkingDead({Key? key}) : super(key: key);
  RouteGenerator routeGenerator = RouteGenerator();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF002B5B),
        appBarTheme: AppBarTheme(color: Color(0xFF2B4865)),
        accentColor: Color(0xFF256D85),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: routeGenerator.onGenerate,
    );
  }
}
