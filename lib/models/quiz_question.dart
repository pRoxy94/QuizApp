class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> get shuffledAnswer {
    /// shuffle func modified the original list 
    /// ---> create a new list from the original list and then call shuffle function.
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}