import 'package:adv_basics/questions_summary/question_identifier.dart';
import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem({required this.itemData, super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = itemData['user_answer'] == itemData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
        QuestionIdentifier(
            questionIndex: ((itemData['question_index'] as int)),
            isCorrectAnswer: isCorrectAnswer
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(itemData['question'] as String,
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 5),
              Text(itemData['user_answer'] as String,
                  style: const TextStyle(color: Colors.blueGrey)),
              Text(itemData['correct_answer'] as String,
                  style: const TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold)),
            ],
          ),
        )
      ]),
    );
  }
}
