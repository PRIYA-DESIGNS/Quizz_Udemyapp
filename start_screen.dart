import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  StartScreen( this.startQuiz,{super.key});
  final void Function() startQuiz;
  @override
  Widget build(context){
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:[
            Image.asset('assets/images/png-transparent-flutter-hd-logo-thumbnail-removebg-preview.png',
              width: 300,
              color: Colors.white,
            ),
            SizedBox(height: 80),
            Text(
              'Learn Flutter the fun way',
              style: TextStyle(
                color: Color.fromARGB(255, 245, 239, 239),
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 30,),
            OutlinedButton.icon(
                onPressed: (){
                  startQuiz();
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text('Start Quiz'),
            )

          ],
        ),
    );
  }
}