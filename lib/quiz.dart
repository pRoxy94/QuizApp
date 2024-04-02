import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  // method provided by the State class. Executed before build method by Flutter
  /// INITSTATE(): Executed by Flutter when the StatefulWidget's State object is initialized
  
  // @override
  // void initState() {
  //   super.initState();
  //   if (kDebugMode) {
  //     print('InitState called');
  //   }
  //   activeScreen = StartScreen(switchScreen);
  // }

  void switchScreen() {
    setState(() {
      if (kDebugMode) {
        print('setState called');
      }

      // activeScreen = const QuestionsScreen();
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
        // selectedAnswers = [];
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  /// BUILD(): Executed by Flutter when the Widget is built for the first time AND after setState() was called
  /// DISPOSE(): Executed by Flutter right before the Widget will be deleted (e.g., because it was displayed conditionally)
  @override
  Widget build(BuildContext context) {
    var screenWidget = activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : QuestionsScreen(onSelectAnswer: chooseAnswer);

    if(activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(chosenAnswer: selectedAnswers, onRestart: restartQuiz);
    }

    /// ALTERNATIVE 2
    /// 
    // Widget screenWidget2 = StartScreen(switchScreen);
    // if(activeScreen == 'questions-screen') {
    //   screenWidget2 = const QuestionsScreen();
    // }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 77, 58, 109),
              Color.fromARGB(255, 21, 21, 21)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
            ),
          child: /** activeScreen */ screenWidget,
          ),
      ),
    );
  }
}
