
import 'package:flutter/foundation.dart';

import '../data/quiz_data.dart';
import '../models/quiz_question.dart';
import '../models/quiz_result.dart';

class QuizProvider extends ChangeNotifier {
  int _currentQuestionIndex = 0;
  final Map<String, int> _answers = {};
  QuizResult? _result;

  // User name
  String _userName = '';

  String get userName => _userName;

  void setUserName(String name) {
    _userName = name.trim();
    notifyListeners();
  }

  // Current quiz state
  int get currentQuestionIndex => _currentQuestionIndex;

  int get totalQuestions => QuizData.questionCount;

  QuizQuestion get currentQuestion =>
      QuizData.questions[_currentQuestionIndex];

  Map<String, int> get answers => Map.unmodifiable(_answers);

  QuizResult? get result => _result;

  bool get isCompleted => _result != null;

  bool get hasAnsweredCurrentQuestion =>
      _answers.containsKey(currentQuestion.id);

  int? get selectedAnswerIndex => _answers[currentQuestion.id];

  double get progress {
    if (totalQuestions == 0) return 0;
    if (isCompleted) return 1;

    return (_currentQuestionIndex + 1) / totalQuestions;
  }

  int get answeredQuestions => _answers.length;

  // Calculate total Cat Energy
  int get totalScore {
    var score = 0;

    for (final question in QuizData.questions) {
      final selectedIndex = _answers[question.id];

      if (selectedIndex != null) {
        score += question.calculateEnergy(selectedIndex) ?? 0;
      }
    }

    return score;
  }

  // Calculate personality scores
  Map<CatPersonality, int> get personalityScores {
    final scores = {
      for (final personality in CatPersonality.values) personality: 0,
    };

    for (final question in QuizData.questions) {
      final selectedIndex = _answers[question.id];

      if (selectedIndex != null) {
        final personality =
        question.calculatePersonality(selectedIndex);

        if (personality != null) {
          scores[personality] = (scores[personality] ?? 0) + 1;
        }
      }
    }

    return scores;
  }

  // Select an answer
  void selectAnswer(int selectedIndex) {
    if (isCompleted) return;

    if (selectedIndex < 0 ||
        selectedIndex >= currentQuestion.options.length) {
      return;
    }

    _answers[currentQuestion.id] = selectedIndex;
    notifyListeners();
  }

  // Move to next question or finish quiz
  void nextQuestion() {
    if (isCompleted || !hasAnsweredCurrentQuestion) return;

    if (_currentQuestionIndex < totalQuestions - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    } else {
      _finishQuiz();
    }
  }

  // Return to previous question
  void previousQuestion() {
    if (isCompleted || _currentQuestionIndex <= 0) return;

    _currentQuestionIndex--;
    notifyListeners();
  }

  // Create final result
  void _finishQuiz() {
    if (answeredQuestions != totalQuestions) return;

    final scores = personalityScores;

    final highestScore = scores.values.reduce(
          (a, b) => a > b ? a : b,
    );

    final tiedPersonalities = scores.entries
        .where((entry) => entry.value == highestScore)
        .map((entry) => entry.key)
        .toSet();

    // Use the latest answer to break a tie
    CatPersonality? winningPersonality;

    for (final question in QuizData.questions.reversed) {
      final selectedIndex = _answers[question.id];

      if (selectedIndex != null) {
        final personality =
        question.calculatePersonality(selectedIndex);

        if (personality != null &&
            tiedPersonalities.contains(personality)) {
          winningPersonality = personality;
          break;
        }
      }
    }

    winningPersonality ??= tiedPersonalities.first;

    _result = QuizResult.fromAnswers(
      totalScore: totalScore,
      minPossibleScore: QuizData.minimumPossibleScore,
      maxPossibleScore: QuizData.maximumPossibleScore,
      personality: winningPersonality,
    );

    notifyListeners();
  }

  // Restart quiz
  void resetQuiz() {
    _currentQuestionIndex = 0;
    _answers.clear();
    _result = null;

    notifyListeners();
  }
}
