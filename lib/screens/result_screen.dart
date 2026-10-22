import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  static const Color backgroundColor = Color(0xFFFFF8F5);
  static const Color primaryColor = Color(0xFFFF8FA3);
  static const Color textColor = Color(0xFF493D46);
  static const Color sageColor = Color(0xFFA8C3A0);

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, quiz, child) {
        final result = quiz.result;

        if (result == null) {
          return Scaffold(
            backgroundColor: backgroundColor,
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Your little check-in is not finished yet.'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).maybePop(),
                    child: const Text('Back to quiz'),
                  ),
                ],
              ),
            ),
          );
        }

        return Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),
                  const Text(
                    'catty',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),

                  Container(
                    width: 112,
                    height: 112,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE4EA),
                      borderRadius: BorderRadius.circular(36),
                    ),
                    child: const Icon(
                      Icons.pets_rounded,
                      color: primaryColor,
                      size: 62,
                    ),
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'YOUR LITTLE CHECK-IN',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Text(
                    result.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: textColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 16),

                  Text(
                    result.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF7F727C),
                      fontSize: 16,
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 28),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: const Color(0xFFF3E4E8),
                      ),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'Your reflection score',
                          style: TextStyle(
                            color: Color(0xFF8D8089),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '${result.totalScore}',
                          style: const TextStyle(
                            color: primaryColor,
                            fontSize: 38,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'out of ${result.maxPossibleScore}',
                          style: const TextStyle(
                            color: Color(0xFF8D8089),
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 18),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: LinearProgressIndicator(
                            value: result.percentage.clamp(0.0, 1.0),
                            minHeight: 9,
                            backgroundColor: const Color(0xFFF3E4E8),
                            valueColor:
                            const AlwaysStoppedAnimation<Color>(
                              sageColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF1E6),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'A gentle reminder',
                          style: TextStyle(
                            color: Color(0xFF52694D),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'This check-in is a moment for self-reflection, '
                              'not a diagnosis. Your feelings can change, and '
                              'you deserve kindness at every stage.',
                          style: TextStyle(
                            color: Color(0xFF52694D),
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        quiz.resetQuiz();
                        Navigator.of(context).popUntil(
                              (route) => route.isFirst,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 56),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        'Take the quiz again',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  TextButton(
                    onPressed: () {
                      Navigator.of(context).popUntil(
                            (route) => route.isFirst,
                      );
                    },
                    child: const Text(
                      'Back to home',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
