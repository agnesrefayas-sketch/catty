
import 'package:flutter/material.dart';

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

  static const Color backgroundColor = Color(0xFFFFF8F5);
  static const Color primaryColor = Color(0xFFE987A5);
  static const Color textColor = Color(0xFF493D46);
  static const Color mutedColor = Color(0xFF9B8E98);
  static const Color sageGreen = Color(0xFFA8BFA3);

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
    final energy = catEnergy.clamp(0, 100);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 16),

              const Text(
                'THE CAT COUNCIL HAS DECIDED',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.4,
                ),
              ),

              const SizedBox(height: 24),

              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE8ED),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFFF9D5DE),
                    width: 3,
                  ),
                ),
                child: Center(
                  child: Icon(
                    personalityIcon,
                    color: primaryColor,
                    size: 78,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Text(
                catPersonality,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: textColor,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                personalityTagline,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: mutedColor,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                ),
              ),

              const SizedBox(height: 32),

              _ScoreCard(
                title: 'Cat Energy',
                score: energy,
                color: primaryColor,
                background: const Color(0xFFF5DDE3),
                description: _energyDescription(energy),
              ),

              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF0E6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
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
                      style: const TextStyle(
                        color: textColor,
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'For fun and self-reflection only.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: mutedColor,
                  fontSize: 11,
                ),
              ),

              const SizedBox(height: 24),

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
  final String description;

  const _ScoreCard({
    required this.title,
    required this.score,
    required this.color,
    required this.background,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: background, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF493D46),
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
            style: const TextStyle(
              color: Color(0xFF9B8E98),
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
