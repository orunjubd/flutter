import 'package:flutter/material.dart';
import 'package:adv_basics/quiz.dart';

void main() {
  runApp(const QuestionAnswer());
}

class QuestionAnswer extends StatelessWidget {
  const QuestionAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Quiz();
  }
}
