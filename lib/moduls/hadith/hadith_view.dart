import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "Hadith view",
      style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        fontFamily: "ElMessiri",
      ),
    ));
  }
}
