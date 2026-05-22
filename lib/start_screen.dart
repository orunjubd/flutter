import 'package:flutter/material.dart';
import 'package:adv_basics/index.dart';

// =====================================================================
// Alternative way
// =====================================================================

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz; // this => void Function() is the type of startQuiz, which is a function that takes no arguments and returns void.

  @override
  Widget build(BuildContext context) {
    return Center(
      child: HomePage(startQuiz),
    );
  }
}