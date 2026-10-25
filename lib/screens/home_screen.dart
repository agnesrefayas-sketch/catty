import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../widgets/name_input_card.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController =
  TextEditingController();

  final GlobalKey<FormState> _formKey =
  GlobalKey<FormState>();

  static const Color primaryColor = Color(0xFFFF8FA3);
  static const Color sageGreen = Color(0xFFA8BFA3);

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _startQuiz() {
    if (!_formKey.currentState!.validate()) return;

    final quiz = context.read<QuizProvider>();

    quiz.setUserName(_nameController.text.trim());
    quiz.resetQuiz();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const QuizScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<QuizProvider>().isDarkMode;

    final backgroundColor = isDark
        ? const Color(0xFF17151B)
        : const Color(0xFFFFF8F5);

    final textColor = isDark
        ? const Color(0xFFF7F0F5)
        : const Color(0xFF493D46);

    final mutedColor = isDark
        ? const Color(0xFFB9AEBB)
        : const Color(0xFF9B8E98);

    final infoCardColor = isDark
        ? const Color(0xFF29332D)
        : const Color(0xFFEAF0E7);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 24,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Logo and theme toggle
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.pets_rounded,
                          color: primaryColor,
                          size: 28,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'catty',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          tooltip: isDark
                              ? 'Switch to light mode'
                              : 'Switch to dark mode',
                          onPressed: () {
                            context
                                .read<QuizProvider>()
                                .toggleTheme();
                          },
                          icon: Icon(
                            isDark
                                ? Icons.light_mode_rounded
                                : Icons.dark_mode_rounded,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // Cat image
                    Container(
                      width: 180,
                      height: 180,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD96C8B),
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/rigby.jpg',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.pets_rounded,
                              color: Colors.white,
                              size: 80,
                            );
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    Text(
                      'Purrfectly Okay?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        height: 1.2,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Discover your inner cat.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color: mutedColor,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      'Are you a sleepy little loaf, a chaotic zoomie '
                          'machine, or a perfectly balanced cat?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.7,
                        color: textColor,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "First, what's your name?",
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    NameInputCard(
                      controller: _nameController,
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty) {
                          return 'Please enter your name first.';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 22),

                    // Information card
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: infoCardColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.spa_rounded,
                            color: sageGreen,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Take the quiz to discover your cat '
                                  'personality and meet your inner cat.',
                              style: TextStyle(
                                color: textColor,
                                fontSize: 13,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Start quiz button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: _startQuiz,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Start My Quiz',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_forward_rounded),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 18),

                    Text(
                      'Every cat has its own kind of purrfection.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: mutedColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
