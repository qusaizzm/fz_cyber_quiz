import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {Key? key,
      required this.score,
      required this.indexAction,
      required this.totalQuestions})
      : super(key: key);
  // here we need the question title and the total number of questions, and also the index

  final String score;
  final int indexAction;
  final int totalQuestions;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            ' ${indexAction + 1}/${totalQuestions}',
            style: const TextStyle(
              fontSize: 18.0,
              // color: neutral,
            ),
          ),
        ),
        Text(
          'Score: $score',
          style: const TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }
}
