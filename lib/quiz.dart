import 'package:flutter/material.dart';
//import 'package:adv_basics/index.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}
//=======================================================================
// Alternative way (1)
//=======================================================================

// class _QuizState extends State<Quiz> {
//   late Widget? activeScreen;
//   @override
//   void initState() {
//     super.initState();
//     activeScreen = StartScreen(switchScreen);
//   }
//   void switchScreen() { // switchScreen()
//     setState(() {
//       activeScreen = const QuestionsScreen();
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 111, 111, 111),
//                 Color.fromARGB(255, 64, 64, 64),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: activeScreen,//const StartScreen(),
//         ),
//       ),
//     );
//   }

// }

//=======================================================================
// Alternative way (2)
//=======================================================================

// class _QuizState extends State<Quiz> {
//   var activeScreen = 'start-screen';

//   void switchScreen() {
//     setState(() {
//       activeScreen = 'questions-screen';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 111, 111, 111),
//                 Color.fromARGB(255, 64, 64, 64),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child:
//               activeScreen ==
//                   'start-screen' // condition Yields true or false
//               ? StartScreen(switchScreen) // value used, if condition is true
//               : const QuestionsScreen(), // value used, if condition is false
//         ),
//       ),
//     );
//   }
// }

//=======================================================================
// Alternative way (3)
//=======================================================================

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers.clear();
        selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    // final screenWidget = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : const QuestionsScreen();

    // ====== Alternative way ===========

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else {
      screenWidget = StartScreen(switchScreen);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 111, 111, 111),
                Color.fromARGB(255, 64, 64, 64),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
