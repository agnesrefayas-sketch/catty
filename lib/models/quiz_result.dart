
import 'quiz_question.dart';

class QuizResult {
  final int totalScore;
  final int maxPossibleScore;
  final int minPossibleScore;
  final CatPersonality personality;

  const QuizResult({
    required this.totalScore,
    required this.maxPossibleScore,
    required this.minPossibleScore,
    required this.personality,
  });

  double get percentage {
    final range = maxPossibleScore - minPossibleScore;

    if (range <= 0) return 0;

    return ((totalScore - minPossibleScore) / range * 100)
        .clamp(0.0, 100.0);
  }

  String get title {
    switch (personality) {
      case CatPersonality.princess:
        return 'The Princess Cat';
      case CatPersonality.orange:
        return 'The Orange Cat';
      case CatPersonality.black:
        return 'The Black Cat';
      case CatPersonality.sleepy:
        return 'The Sleepy Cat';
      case CatPersonality.curious:
        return 'The Curious Cat';
    }
  }

  String get tagline {
    switch (personality) {
      case CatPersonality.princess:
        return 'Soft, Sweet & Lovable';
      case CatPersonality.orange:
        return 'Chaotic, Fun & Fearless';
      case CatPersonality.black:
        return 'Quiet, Cool & Mysterious';
      case CatPersonality.sleepy:
        return 'Chill, Cozy & Peaceful';
      case CatPersonality.curious:
        return 'Creative, Curious & Clever';
    }
  }

  String get description {
    switch (personality) {
      case CatPersonality.princess:
        return 'You are sweet, affectionate, and love making '
            'people feel special. You appreciate little gestures '
            'and meaningful connections.';

      case CatPersonality.orange:
        return 'You are spontaneous, energetic, and full of '
            'surprises. You love trying new things and making '
            'ordinary days more exciting.';

      case CatPersonality.black:
        return 'You are independent, observant, and a little '
            'mysterious. You value your personal space and '
            'open up to people you truly trust.';

      case CatPersonality.sleepy:
        return 'You appreciate peace, comfort, and a slower '
            'pace of life. You enjoy cozy moments and know '
            'when it is time to recharge.';

      case CatPersonality.curious:
        return 'You love exploring new ideas, asking questions, '
            'and discovering how things work. Your creative '
            'mind is always looking for a new adventure.';
    }
  }

  String get scoreLabel => '$totalScore / $maxPossibleScore';

  factory QuizResult.fromAnswers({
    required int totalScore,
    required int minPossibleScore,
    required int maxPossibleScore,
    required CatPersonality personality,
  }) {
    return QuizResult(
      totalScore: totalScore,
      minPossibleScore: minPossibleScore,
      maxPossibleScore: maxPossibleScore,
      personality: personality,
    );
  }

  // Keep the old factory for compatibility.
  factory QuizResult.fromScore({
    required int totalScore,
    required int maxPossibleScore,
    required int minPossibleScore,
  }) {
    final range = maxPossibleScore - minPossibleScore;

    final percentage = range <= 0
        ? 0.0
        : ((totalScore - minPossibleScore) / range * 100)
        .clamp(0.0, 100.0);

    final CatPersonality personality;

    if (percentage >= 80) {
      personality = CatPersonality.orange;
    } else if (percentage >= 60) {
      personality = CatPersonality.curious;
    } else if (percentage >= 40) {
      personality = CatPersonality.princess;
    } else if (percentage >= 20) {
      personality = CatPersonality.sleepy;
    } else {
      personality = CatPersonality.black;
    }

    return QuizResult(
      totalScore: totalScore,
      maxPossibleScore: maxPossibleScore,
      minPossibleScore: minPossibleScore,
      personality: personality,
    );
  }
}
