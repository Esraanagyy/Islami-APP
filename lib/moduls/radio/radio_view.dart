import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioView extends StatelessWidget {
  const RadioView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "Radio view",
      style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        fontFamily: "ElMessiri",
      ),
    ));
  }
}
