import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.onSelectAnswer, super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// ALTERNATIVE TO COLUMN mainAxisSize --> 
    /// WRAP COLUMN WITH SIZEDBOX WIDGET AND SET WIDTH TO double.infinity 
    /// and COLUMN MAINAXISALIGNMENT TO .center
    final currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,             
              style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
            ),

            const SizedBox(height: 30),

            ...currentQuestion.shuffledAnswer.map((answer) {
              return AnswerButton(
                answerText: answer, 
                onTap: () { 
                  answerQuestion(answer);
                }
              );
            })
          ],
        ),
      ),
    );
  }
}
