class Question{
  final String q;
  final List<String> w;
  const Question(this.q,this.w);

  List<String> get shuffledAnswer{
    final shuffledList=List.of(w);
    shuffledList.shuffle();
    return shuffledList;
  }
}