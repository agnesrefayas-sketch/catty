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
  });

  int get optionCount => options.length;

  int get maxScore {
    if (scores.isEmpty) return 0;

    return scores.reduce((a, b) => a > b ? a : b);
  }

  int get minScore {
    if (scores.isEmpty) return 0;

    return scores.reduce((a, b) => a < b ? a : b);
  }

  bool get isValid {
    return id.trim().isNotEmpty &&
        question.trim().isNotEmpty &&
        options.length >= 2 &&
        options.length == scores.length &&
        options.every((option) => option.trim().isNotEmpty) &&
        scores.every((score) => score >= 0);
  }

  int? calculateScore(int selectedIndex) {
    if (selectedIndex < 0 || selectedIndex >= scores.length) {
      return null;
    }

    return scores[selectedIndex];
  }
}
