import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    // 1. Trigger the parent callback to save the answer
    widget.onSelectAnswer(selectedAnswer);
    // Handle answer selection logic here
    // For example, you can check if the selected answer is correct and update the score
    setState(() {
      currentQuestionIndex++; // Move to the next question (increments the value by 1)
    });
  }

  @override
  Widget build(context) {
    // return const Center(
    //   child: Text('Questions Screen'),
    // );
    final currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Container(
        padding: const EdgeInsets.all(24.0),
        margin: const EdgeInsets.all(40),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 255, 168, 168),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ), // Add space between question and answers
              //============== Alternative way (1) using for loop ==============================

              // for (var answer in currentQuestion.answers) ...[
              //   AnswerButton(
              //     answerText: answer,
              //     onTap: () {
              //       answerQuestion(answer);
              //     },
              //   ),
              //   const SizedBox(height: 12),

              //============== Alternative way (1) using map ==============================
              ...currentQuestion.getShuffledAnswers().map((answer) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: AnswerButton(
                    answerText: answer,
                    onTap: () {
                      answerQuestion(answer);
                    },
                  ),
                );
              }),

              // AnswerButton(
              //   answerText: currentQuestion.answers[0],
              //   onTap: () {
              //     // Handle answer 1 tap
              //   },
              // ),
              // const SizedBox(height: 12),
              // AnswerButton(
              //   answerText: currentQuestion.answers[1],
              //   onTap: () {
              //     // Handle answer 2 tap
              //   },
              // ),
              // const SizedBox(height: 12),
              // AnswerButton(
              //   answerText: currentQuestion.answers[2],
              //   onTap: () {
              //     // Handle answer 3 tap
              //   },
              // ),
              // const SizedBox(height: 12),
              // AnswerButton(
              //   answerText: currentQuestion.answers[3],
              //   onTap: () {
              //     // Handle answer 4 tap
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
