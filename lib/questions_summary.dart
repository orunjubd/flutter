import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 400, // Adjusted slightly to show more items like the screenshot
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            // Check if the answer is correct to decide circle color
            final isCorrect = data['user_answer'] == data['correct_answer'];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Aligns number to the top
                children: [
                  // Circular Question Number
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isCorrect
                          ? const Color.fromARGB(
                              255,
                              150,
                              198,
                              241,
                            ) // Light Blue if correct
                          : const Color.fromARGB(
                              255,
                              249,
                              133,
                              241,
                            ), // Pink if incorrect
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(
                          255,
                          22,
                          2,
                          56,
                        ), // Dark text inside circle
                      ),
                    ),
                  ),
                  const SizedBox(width: 20), // Space between number and text
                  // Question and Answers Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Left-align all text
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data['user_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(
                              255,
                              202,
                              171,
                              252,
                            ), // Soft tinted purple
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: const TextStyle(
                            color: Color.fromARGB(
                              255,
                              181,
                              254,
                              246,
                            ), // Soft tinted blue
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
