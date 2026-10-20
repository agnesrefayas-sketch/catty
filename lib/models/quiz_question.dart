
class QuizQuestion {
  final String id;
  final String question;
  final List<String> options;
  final List<int> scores;

  const QuizQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.scores,
  }) : assert(options.length == scores.length),
        assert(options.length >= 2),
        assert(scores.every((score) => score >= 0));

  int get optionCount => options.length;

  int get maxScore =>
      scores.isEmpty ? 0 : scores.reduce((a, b) => a > b ? a : b);

  int get minScore =>
      scores.isEmpty ? 0 : scores.reduce((a, b) => a < b ? a : b);

  bool get isValid => id.trim().isNotEmpty &&
      question.trim().isNotEmpty &&
      options.length >= 2 &&
      options.length == scores.length &&
      options.every((option) => option.trim().isNotEmpty) &&
      scores.every((score) => score >= 0);

  int? calculateScore(int selectedIndex) {
    if (selectedIndex < 0 || selectedIndex >= scores.length) {
      return null;
    }

    return scores[selectedIndex];
  }
}
