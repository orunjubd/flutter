import 'package:adv_basics/data/questions.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/questions_summary.dart';
//import 'package:flutter_icons/flutter_icons.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    // Map <K Value, V Value>
    // final summaryData = <Map<String, Object>>[];
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summaryData;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectionQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Scaffold(
      // 1. This ensures the background color stretches flawlessly across any screen height
      backgroundColor: const Color.fromARGB(255, 109, 69, 169),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Your answer $numCorrectionQuestions out of $numTotalQuestions questions correctly!',
                  textAlign: TextAlign.center, // Centered like the screenshot
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // 2. Changed to Expanded so the summary list scales perfectly
                // without leaving random white space at the bottom.
                Expanded(child: QuestionsSummary(summaryData)),

                const SizedBox(height: 30),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: onRestart,
                    icon: const Icon(Icons.restart_alt),
                    label: const Text('Restart Quiz'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      fixedSize: const Size(180, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
