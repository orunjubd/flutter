import 'package:flutter/material.dart';
//import 'package:adv_basics/quiz.dart';
//import 'package:adv_basics/start_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min,
      children: [
        const Image(
          image: AssetImage('assets/images/quiz-logo.png'),
          width: 300,
          color: Color.fromARGB(90, 255, 255, 255), // Add a white color filter with reduced opacity
          //height: 200,
        ),

        //=======================================================================
        // different way Image opacity
        //======================================================================= 
       // Opacity(
        //   opacity: 0.6,
        //   child: const Image(
        //     image: AssetImage('assets/images/quiz-logo.png'),
        //     width: 300,
        //     //height: 200,
        //   ),
        // ),        
        
        const SizedBox(height: 20), //make space between text and image
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20), //make space between text and button
        
        //TextButton(
        // OutlinedButton(
        //   onPressed: startQuiz,
        //   style: OutlinedButton.styleFrom(
        //     foregroundColor: Colors.white,
        //     backgroundColor: const Color.fromARGB(255, 81, 81, 81),
        //     padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        //   ),
        //   child: const Text(
        //     'Start Quiz',
        //     style: TextStyle(fontSize: 18),
        //   ),
        // ),

        //=======================================================================
        // If use ICON here use code slightly different from TextButton or OutlinedButton
        //=======================================================================
         OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color.fromARGB(255, 81, 81, 81),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          ),
          icon: const Icon(
            Icons.arrow_forward,
            size: 24,
          ),
          label: const Text(
            'Start Quiz',
            style: TextStyle(fontSize: 18),
          ),
         )  
      ],
    );
  }
}