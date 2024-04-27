import 'package:flutter/material.dart';
import 'package:flutterproject1/questions_summary.dart';
import 'package:flutterproject1/quiz_questions.dart';

class resultsScreen extends StatelessWidget{
  resultsScreen({super.key, required this.chosenAnswers ,required this.cScreen});
  final void Function() cScreen;

  final List<String> chosenAnswers;

  List <Map<String, Object>> getSummaryData(){
    final List <Map<String, Object>> summary=[];
    for(var i=0; i<chosenAnswers.length; i++){
      summary.add(
        {
        'question-index': i,
        'question': questions[i].text,
        'correct-answer': questions[i].answers[0],
        'user-answer' : chosenAnswers[i],
        },);
    };
    return summary;
  }
  @override
  Widget build(BuildContext context){
    final summaryData= getSummaryData();
    final numTotalQuestions=questions.length;
    final numCorrectQuestions=summaryData.where((data) {
      return data['user-answer']==data['correct-answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('The correct number of questions from $numTotalQuestions are $numCorrectQuestions',style: TextStyle(color: Color.fromARGB(
            255, 158, 218, 86)),),
            SizedBox(height: 20),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: (){
                  cScreen();
                },
                child:Text(
                  'Restart',style: TextStyle(color: Color.fromARGB(
                    255, 133, 71, 147)),
                ),
              style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(10,10))),
                backgroundColor:const Color.fromARGB(255, 168, 232, 232)
              ),
            ),

          ],
        ),
      ),
    );
  }

}