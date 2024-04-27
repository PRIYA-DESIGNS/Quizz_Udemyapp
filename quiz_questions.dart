import 'package:flutter/material.dart';
import 'package:flutterproject1/questions1.dart';
const questions =[
  QuizQuestion(
    'What are the main building blocks of flutter UI?',
    [
      'Widgets',
      'components',
      'blocks',
      'functions'
    ],
  ),
  QuizQuestion(
    'Which widget would you try to use more often?',
    [
      'Stateless',
      'Stateful',
      'Inherited',
    ],
  ),
  QuizQuestion(
    'What happens if you change the data in a stateless widget?',
    [
      'The UI is not updated',
      'The UI is updated',
      'The closest ststeful widget is updated',
      'Any nested stateful widgets are updated'
    ],
  ),
  QuizQuestion(
    'How should you update the data inside of Stateful widget?',
    [
      'By calling setState()',
      'By calling updateData()',
      'By calling updateUI',
      'By calling updateState()',
    ]
  ),
];
class AnswerButton extends StatelessWidget{
  const AnswerButton({required this.answerText, required this.onTap, super.key});
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      onPressed:onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: Color.fromARGB(255, 33, 1, 95),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child:  Text(answerText),
    );
  }
}