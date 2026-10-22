enum CatMood {
  thriving,
  doingOkay,
  needsRest,
  feelingLow,
  needsSupport,
}

class QuizResult {
  final int totalScore;
  final int maxPossibleScore;
  final int minPossibleScore;
  final CatMood mood;

  const QuizResult({
    required this.totalScore,
    required this.maxPossibleScore,
    required this.minPossibleScore,
    required this.mood,
  })  : assert(maxPossibleScore >= minPossibleScore),
        assert(totalScore >= minPossibleScore),
        assert(totalScore <= maxPossibleScore);

  double get percentage {
    final range = maxPossibleScore - minPossibleScore;

    if (range == 0) {
      return 0;
    }

    return (totalScore - minPossibleScore) / range * 100;
  }

  String get title {
    switch (mood) {
      case CatMood.thriving:
        return 'Thriving Cat';
      case CatMood.doingOkay:
        return 'Doing-Okay Cat';
      case CatMood.needsRest:
        return 'Sleepy Cat';
      case CatMood.feelingLow:
        return 'Low-Energy Cat';
      case CatMood.needsSupport:
        return 'Comfort-Seeking Cat';
    }
  }

  String get description {
    switch (mood) {
      case CatMood.thriving:
        return 'You seem ready to explore, play, and enjoy '
            'the little things. Keep making room for rest, too!';
      case CatMood.doingOkay:
        return 'You seem to have a fairly balanced vibe. '
            'Remember to appreciate your small wins.';
      case CatMood.needsRest:
        return 'Even cats need a quiet corner sometimes. '
            'Give yourself permission to slow down and recharge.';
      case CatMood.feelingLow:
        return 'Some days can feel heavier than others. '
            'Try a gentle activity and take things one step at a time.';
      case CatMood.needsSupport:
        return 'You deserve care and kindness, too. '
            'Consider reaching out to someone you trust if things feel difficult.';
    }
  }

  String get scoreLabel => '$totalScore / $maxPossibleScore';

  factory QuizResult.fromScore({
    required int totalScore,
    required int maxPossibleScore,
    required int minPossibleScore,
  }) {
    if (maxPossibleScore <= minPossibleScore) {
      throw ArgumentError(
        'Maximum score must be greater than minimum score.',
      );
    }

    if (totalScore < minPossibleScore ||
        totalScore > maxPossibleScore) {
      throw ArgumentError(
        'Total score must be within the minimum and maximum scores.',
      );
    }

    final percentage = (totalScore - minPossibleScore) /
        (maxPossibleScore - minPossibleScore) *
        100;

    final CatMood mood;

    if (percentage >= 80) {
      mood = CatMood.thriving;
    } else if (percentage >= 60) {
      mood = CatMood.doingOkay;
    } else if (percentage >= 40) {
      mood = CatMood.needsRest;
    } else if (percentage >= 20) {
      mood = CatMood.feelingLow;
    } else {
      mood = CatMood.needsSupport;
    }

    return QuizResult(
      totalScore: totalScore,
      maxPossibleScore: maxPossibleScore,
      minPossibleScore: minPossibleScore,
      mood: mood,
    );
  }
}
