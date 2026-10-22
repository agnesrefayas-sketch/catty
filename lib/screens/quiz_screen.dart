import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';

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

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: quiz.progress,
                      minHeight: 8,
                      backgroundColor: const Color(0xFFF3E4E8),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 36),

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
                          'A little check-in with yourself',
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
                    'Choose what feels closest to you',
                    style: TextStyle(
                      fontSize: 14,
                      color: mutedColor,
                    ),
                  ),
                  const SizedBox(height: 14),

                  Expanded(
                    child: ListView.separated(
                      itemCount: question.options.length,
                      separatorBuilder: (_, _) =>
                      const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final isSelected =
                            quiz.selectedAnswerIndex == index;

                        return Material(
                          color: isSelected
                              ? const Color(0xFFFFE4EA)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(18),
                            onTap: () => quiz.selectAnswer(index),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 17,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                  color: isSelected
                                      ? primaryColor
                                      : const Color(0xFFF0E5E8),
                                  width: isSelected ? 2 : 1,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 28,
                                    height: 28,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: isSelected
                                          ? primaryColor
                                          : const Color(0xFFFFF1F4),
                                    ),
                                    child: Text(
                                      String.fromCharCode(65 + index),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isSelected
                                            ? Colors.white
                                            : mutedColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Expanded(
                                    child: Text(
                                      question.options[index],
                                      style: const TextStyle(
                                        fontSize: 15,
                                        height: 1.4,
                                        color: textColor,
                                      ),
                                    ),
                                  ),
                                  if (isSelected)
                                    const Icon(
                                      Icons.check_circle_rounded,
                                      color: primaryColor,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 16),
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
                              ? quiz.nextQuestion
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
