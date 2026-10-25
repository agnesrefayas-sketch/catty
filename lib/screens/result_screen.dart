
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';

class ResultScreen extends StatelessWidget {
  final int catEnergy;
  final String catPersonality;
  final String catDescription;
  final VoidCallback onRetake;

  const ResultScreen({
    super.key,
    required this.catEnergy,
    required this.catPersonality,
    required this.catDescription,
    required this.onRetake,
  });

  static const Color primaryColor = Color(0xFFE987A5);
  static const Color sageGreen = Color(0xFFA8BFA3);

  String get catGif {
    final personality = catPersonality.toLowerCase();

    if (personality.contains('princess')) {
      return 'assets/images/cat_princess.gif';
    } else if (personality.contains('orange')) {
      return 'assets/images/cat_orange.gif';
    } else if (personality.contains('black')) {
      return 'assets/images/cat_black.gif';
    } else if (personality.contains('sleepy')) {
      return 'assets/images/cat_sleepy.gif';
    } else if (personality.contains('curious')) {
      return 'assets/images/cat_curious.gif';
    }

    return 'assets/images/cat_curious.gif';
  }

  IconData get personalityIcon {
    final personality = catPersonality.toLowerCase();

    if (personality.contains('princess')) {
      return Icons.favorite_rounded;
    } else if (personality.contains('orange')) {
      return Icons.wb_sunny_rounded;
    } else if (personality.contains('black')) {
      return Icons.nightlight_round;
    } else if (personality.contains('sleepy')) {
      return Icons.bedtime_rounded;
    } else if (personality.contains('curious')) {
      return Icons.travel_explore_rounded;
    }

    return Icons.pets_rounded;
  }

  String get personalityTagline {
    final personality = catPersonality.toLowerCase();

    if (personality.contains('princess')) {
      return 'Soft, sweet, and lovable.';
    } else if (personality.contains('orange')) {
      return 'A little chaotic, a lot of fun.';
    } else if (personality.contains('black')) {
      return 'Quiet, cool, and mysterious.';
    } else if (personality.contains('sleepy')) {
      return 'Cozy vibes and peaceful minds.';
    } else if (personality.contains('curious')) {
      return 'Always curious, always exploring.';
    }

    return 'Every cat has its own personality.';
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final isDark = quiz.isDarkMode;
    final energy = catEnergy.clamp(0, 100);
    final userName = quiz.userName;

    final backgroundColor = isDark
        ? const Color(0xFF17151B)
        : const Color(0xFFFFF8F5);

    final cardColor = isDark
        ? const Color(0xFF292530)
        : Colors.white;

    final textColor = isDark
        ? const Color(0xFFF7F0F5)
        : const Color(0xFF493D46);

    final mutedColor = isDark
        ? const Color(0xFFB9AEBB)
        : const Color(0xFF9B8E98);

    final imageBackground = isDark
        ? const Color(0xFF3A2934)
        : const Color(0xFFFFE8ED);

    final imageBorder = isDark
        ? const Color(0xFF674451)
        : const Color(0xFFF9D5DE);

    final scoreBackground = isDark
        ? const Color(0xFF44313D)
        : const Color(0xFFF5DDE3);

    final descriptionBackground = isDark
        ? const Color(0xFF29332D)
        : const Color(0xFFEAF0E6);

    final borderColor = isDark
        ? const Color(0xFF443B49)
        : const Color(0xFFF5E5E8);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 16),

              // Personalized result heading
              Text(
                userName.isEmpty
                    ? "You're $catPersonality!"
                    : "$userName, you're $catPersonality!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 24),

              // Animated GIF based on cat personality
              Container(
                width: 220,
                height: 220,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: imageBackground,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: imageBorder,
                    width: 3,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    catGif,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        personalityIcon,
                        color: primaryColor,
                        size: 78,
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Text(
                catPersonality,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                personalityTagline,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: mutedColor,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
              ),

              const SizedBox(height: 32),

              // Cat energy score
              _ScoreCard(
                title: 'Cat Energy',
                score: energy,
                color: primaryColor,
                background: scoreBackground,
                cardColor: cardColor,
                borderColor: borderColor,
                textColor: textColor,
                mutedColor: mutedColor,
                description: _energyDescription(energy),
              ),

              const SizedBox(height: 24),

              // Personality description
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: descriptionBackground,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'So, What Kind of Cat Are You?',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      catDescription,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'For fun and self-reflection only.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: mutedColor,
                  fontSize: 11,
                ),
              ),

              const SizedBox(height: 24),

              // Retake quiz button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton.icon(
                  onPressed: onRetake,
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text(
                    'MEOW AGAIN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  static String _energyDescription(int score) {
    if (score >= 85) {
      return 'Maximum meow energy! You are ready to '
          'explore, play, and turn ordinary days into adventures.';
    }

    if (score >= 65) {
      return 'Your inner cat is coming out! You have '
          'plenty of playful energy and curious little habits.';
    }

    if (score >= 40) {
      return 'Part-time cat, full-time mystery. '
          'Your whiskers are still loading.';
    }

    return 'A quiet little kitty today. Take things '
        'at your own pace and enjoy the little moments.';
  }
}

class _ScoreCard extends StatelessWidget {
  final String title;
  final int score;
  final Color color;
  final Color background;
  final Color cardColor;
  final Color borderColor;
  final Color textColor;
  final Color mutedColor;
  final String description;

  const _ScoreCard({
    required this.title,
    required this.score,
    required this.color,
    required this.background,
    required this.cardColor,
    required this.borderColor,
    required this.textColor,
    required this.mutedColor,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: borderColor,
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '$score%',
                style: TextStyle(
                  color: color,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: score / 100,
              minHeight: 10,
              backgroundColor: background,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),

          const SizedBox(height: 12),

          Text(
            description,
            style: TextStyle(
              color: mutedColor,
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
