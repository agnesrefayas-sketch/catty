
import 'package:flutter/foundation.dart';

import '../data/quiz_data.dart';
import '../models/quiz_question.dart';
import '../models/quiz_result.dart';

class QuizProvider extends ChangeNotifier {
  int _currentQuestionIndex = 0;
  final Map<String, int> _answers = {};
  QuizResult? _result;

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

  int? get selectedAnswerIndex =>
      _answers[currentQuestion.id];

  double get progress {
    if (totalQuestions == 0) return 0;
    if (isCompleted) return 1;

    return (_currentQuestionIndex + 1) / totalQuestions;
  }

  int get answeredQuestions => _answers.length;

  // Calculate the score from all selected answers
  int get totalScore {
    var score = 0;

    for (final question in QuizData.questions) {
      final selectedIndex = _answers[question.id];

      if (selectedIndex != null &&
          selectedIndex >= 0 &&
          selectedIndex < question.scores.length) {
        score += question.scores[selectedIndex];
      }
    }

    return score;
  }

  // Select an answer for the current question
  void selectAnswer(int selectedIndex) {
    if (isCompleted) return;

    if (selectedIndex < 0 ||
        selectedIndex >= currentQuestion.options.length) {
      return;
    }

    _answers[currentQuestion.id] = selectedIndex;
    notifyListeners();
  }

  // Move to the next question or finish the quiz
  void nextQuestion() {
    if (isCompleted || !hasAnsweredCurrentQuestion) return;

    if (_currentQuestionIndex < totalQuestions - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    } else {
      _finishQuiz();
    }
  }

  // Return to the previous question
  void previousQuestion() {
    if (isCompleted || _currentQuestionIndex <= 0) return;

    _currentQuestionIndex--;
    notifyListeners();
  }

  // Create the final result
  void _finishQuiz() {
    _result = QuizResult.fromScore(
      totalScore: totalScore,
      minPossibleScore: QuizData.minimumPossibleScore,
      maxPossibleScore: QuizData.maximumPossibleScore,
    );

    notifyListeners();
  }

  // Restart the quiz from the beginning
  void resetQuiz() {
    _currentQuestionIndex = 0;
    _answers.clear();
    _result = null;

    notifyListeners();
  }
}
