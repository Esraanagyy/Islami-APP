import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SebhaView extends StatelessWidget {
  const SebhaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "Sebha view",
      style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        fontFamily: "ElMessiri",
      ),
    ));
  }
}
