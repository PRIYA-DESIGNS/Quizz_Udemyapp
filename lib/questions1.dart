//the main functions are written that are used to write questions by passing them as argument
class QuizQuestion{
  const QuizQuestion(this.text, this.answers);
  final  String text;
  final List<String> answers;

  // This function helps in shuffling the answers of the list so that the answers are not the same everytime
  List<String> getShuffleAnswers(){
    final shuffledList=List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}