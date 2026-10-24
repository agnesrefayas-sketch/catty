enum CatPersonality {
  princess,
  orange,
  black,
  sleepy,
  curious,
}

class QuizQuestion {
  final String id;
  final String question;
  final List<String> options;
  final List<CatPersonality> answerPersonalities;
  final List<int> energyScores;

  const QuizQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.answerPersonalities,
    required this.energyScores,
  });

  int get optionCount => options.length;

  int get maxScore {
    if (energyScores.isEmpty) return 0;
    return energyScores.reduce((a, b) => a > b ? a : b);
  }

  int get minScore {
    if (energyScores.isEmpty) return 0;
    return energyScores.reduce((a, b) => a < b ? a : b);
  }

  bool get isValid {
    return id.trim().isNotEmpty &&
        question.trim().isNotEmpty &&
        options.length >= 2 &&
        options.length == answerPersonalities.length &&
        options.length == energyScores.length &&
        options.every((option) => option.trim().isNotEmpty) &&
        energyScores.every((score) => score >= 0);
  }

  CatPersonality? calculatePersonality(int selectedIndex) {
    if (selectedIndex < 0 ||
        selectedIndex >= answerPersonalities.length) {
      return null;
    }

    return answerPersonalities[selectedIndex];
  }

  int? calculateEnergy(int selectedIndex) {
    if (selectedIndex < 0 || selectedIndex >= energyScores.length) {
      return null;
    }

    return energyScores[selectedIndex];
  }
}
