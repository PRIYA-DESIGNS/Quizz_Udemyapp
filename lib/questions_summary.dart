import 'package:flutter/material.dart';
class QuestionSummary extends StatelessWidget{
  const QuestionSummary(this.summaryData,{super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data){
            return Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0,0,10,70),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Colors.blueAccent
                  ),
                  width: 30,
                  height: 30,
                  child: Center(
                    child: Text(((data['question-index'] as int) + 1).toString(), style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.blueAccent,
                    ),),
                  ),
                ),
                Expanded(
                  child: Column(children: [
                    Text(data['question'] != null ? data['question'] as String : 'No question' , style: TextStyle(color: Colors.white),),
                    const SizedBox(height: 5,),
                    Text(data['user-answer'] != null ? data['user-answer'] as String : 'No question',style: TextStyle(color: Color.fromARGB(
                        255, 158, 218, 86)),),
                    Text(data['correct-answer'] != null ? data['correct-answer'] as String : 'No question',style: TextStyle(color: Color.fromARGB(
                        255, 121, 225, 214))),
                    SizedBox(height: 30,)
                  ],),
                ),
              ],
            );
          },).toList(),
        ),
      ),
    );
  }
}