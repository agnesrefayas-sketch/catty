import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/answer_option_card.dart';
import 'result_screen.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  static const Color backgroundColor = Color(0xFFFFF8F5);
  static const Color primaryColor = Color(0xFFFF8FA3);
  static const Color textColor = Color(0xFF493D46);
  static const Color mutedColor = Color(0xFF9B8E98);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Consumer<QuizProvider>(
          builder: (context, quiz, child) {
            final question = quiz.currentQuestion;

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      IconButton(
                        onPressed: quiz.currentQuestionIndex > 0
                            ? quiz.previousQuestion
                            : () => Navigator.of(context).maybePop(),
                        icon: const Icon(Icons.arrow_back_rounded),
                        color: textColor,
                      ),
                      const Spacer(),
                      const Text(
                        'catty',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.pets_rounded,
                        color: primaryColor,
                        size: 26,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Question number
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'QUESTION ${quiz.currentQuestionIndex + 1}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: mutedColor,
                        ),
                      ),
                      Text(
                        '${quiz.currentQuestionIndex + 1} of ${quiz.totalQuestions}',
                        style: const TextStyle(
                          fontSize: 13,
                          color: mutedColor,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Progress indicator
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: quiz.progress,
                      minHeight: 8,
                      backgroundColor: const Color(0xFFF3E4E8),
                      valueColor:
                      const AlwaysStoppedAnimation<Color>(
                        primaryColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 36),

                  // Question card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: const Color(0xFFF5E5E8),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Lets get this meow-ving!',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          question.question,
                          style: const TextStyle(
                            fontSize: 23,
                            height: 1.4,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    'Trust your whiskers. Choose wisely.',
                    style: TextStyle(
                      fontSize: 14,
                      color: mutedColor,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Reusable answer option cards
                  Expanded(
                    child: ListView.separated(
                      itemCount: question.options.length,
                      separatorBuilder: (_, _) =>
                      const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final isSelected =
                            quiz.selectedAnswerIndex == index;

                        return AnswerOptionCard(
                          text: question.options[index],
                          label: String.fromCharCode(65 + index),
                          isSelected: isSelected,
                          onTap: () => quiz.selectAnswer(index),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Navigation buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: quiz.currentQuestionIndex > 0
                              ? quiz.previousQuestion
                              : null,
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(0, 54),
                            foregroundColor: textColor,
                            side: const BorderSide(
                              color: Color(0xFFF0DDE3),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: const Text('Back'),
                        ),
                      ),

                      const SizedBox(width: 14),

                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: quiz.hasAnsweredCurrentQuestion
                              ? () {
                            if (quiz.currentQuestionIndex ==
                                quiz.totalQuestions - 1) {
                              quiz.nextQuestion();

                              if (quiz.result != null) {
                                final result = quiz.result!;

                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => ResultScreen(
                                      catEnergy: result.percentage.round(),
                                      catPersonality: result.title,
                                      catDescription: result.description,
                                      onRetake: () {
                                        quiz.resetQuiz();
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                );
                              }
                            } else {
                              quiz.nextQuestion();
                            }
                          }
                              : null,
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(0, 54),
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            disabledBackgroundColor:
                            const Color(0xFFF0DDE3),
                            disabledForegroundColor: mutedColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: Text(
                            quiz.currentQuestionIndex ==
                                quiz.totalQuestions - 1
                                ? 'See My Result'
                                : 'Next  →',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
