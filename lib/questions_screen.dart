import 'package:flutter/material.dart';
import 'package:flutterproject1/quiz_questions.dart';


class QuestionScreen extends StatefulWidget{
  const QuestionScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionScreen> createState(){
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen>{
  final List<String> selectedAnswers=[];
  var currentQuestionIndex=0;

  void answerQuestion(String selectedAnswers){
    widget.onSelectAnswer(selectedAnswers);
    setState(() {
      currentQuestionIndex ++;
    });
  }

  @override
  Widget build(context){
    final currentQuestion= questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.stretch ,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(currentQuestion.text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height:30),
            ...currentQuestion.getShuffleAnswers().map((item){
                return AnswerButton(answerText: item, onTap:(){
                  answerQuestion(item);
                });
            }),
          ],
        )
      ),
    );
  }
}