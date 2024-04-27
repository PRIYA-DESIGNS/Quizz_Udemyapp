import 'package:flutter/material.dart';
import 'package:flutterproject1/quiz_questions.dart';
import 'package:flutterproject1/questions_screen.dart';
import 'package:flutterproject1/results_screen.dart';
import 'package:flutterproject1/start_screen.dart';
class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}
class _QuizState extends State <Quiz>{
  List<String> selectedAnswers=[];
  //Widget? activeScreen;
  var activeScreen= 'start-screen';
  //void initState() {
  //  activeScreen=StartScreen(switchScreen);
  //  super.initState();
  //}
  void switchScreen(){
    setState(() {
      activeScreen= 'question-screen';
    });
  }

  //add answer to a list to store it for the end result where all answers are shown
  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if (selectedAnswers.length==questions.length){
      setState(() {
        activeScreen='results-screen';
      });
    };
  }

  void changeScreen(){
    setState(() {
      activeScreen='start-screen';
    });
    selectedAnswers=[];
  }

  @override
  Widget build(context){
    var screenWidget=activeScreen=='start-screen'? StartScreen(switchScreen) : QuestionScreen(onSelectAnswer: chooseAnswer);
    if (activeScreen=='results-screen'){
      screenWidget=resultsScreen(chosenAnswers: selectedAnswers, cScreen:changeScreen );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration:const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purple,
                  Colors.deepPurple
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
          ),
          child: screenWidget, //activeScreen
        ),
      ),
    );
  }
}