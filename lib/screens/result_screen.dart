
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int catEnergy;
  final int catWellness;
  final String catPersonality;
  final String catDescription;
  final VoidCallback onRetake;

  const ResultScreen({
    super.key,
    required this.catEnergy,
    required this.catWellness,
    required this.catPersonality,
    required this.catDescription,
    required this.onRetake,
  });

  static const Color backgroundColor = Color(0xFFFFF8F5);
  static const Color primaryColor = Color(0xFFE987A5);
  static const Color textColor = Color(0xFF493D46);
  static const Color mutedColor = Color(0xFF9B8E98);
  static const Color sageGreen = Color(0xFFA8BFA3);

  @override
  Widget build(BuildContext context) {
    final energy = catEnergy.clamp(0, 100);
    final wellness = catWellness.clamp(0, 100);

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
                child: const Center(
                  child: Icon(
                    Icons.pets_rounded,
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

              const Text(
                'No thoughts. Just meow.',
                style: TextStyle(
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

              const SizedBox(height: 16),

              _ScoreCard(
                title: 'Cat Wellness',
                score: wellness,
                color: sageGreen,
                background: const Color(0xFFE4EBDD),
                description: _wellnessDescription(wellness),
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
                      'Your cat report',
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
                'For fun and self-reflection only, not a medical assessment.',
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
      return 'Your inner cat has escaped containment. '
          'The brain cell is on vacation. Maximum meow energy.';
    }
    if (score >= 65) {
      return 'Certified cat behavior detected. '
          'You probably stare at walls for absolutely no reason.';
    }
    if (score >= 40) {
      return 'Part-time cat, full-time mystery. '
          'Your whiskers are still loading.';
    }
    return 'A human disguise with suspiciously cat-like tendencies. '
        'The cat council is keeping an eye on you.';
  }

  static String _wellnessDescription(int score) {
    if (score >= 85) {
      return 'Hydrated, rested, and thriving. '
          'The neighborhood cats are asking for your secrets.';
    }
    if (score >= 65) {
      return 'Not bad, little furball. '
          'A few habits could use some paw-sitive changes.';
    }
    if (score >= 40) {
      return 'The cat wellness department has opened a case. '
          'Please report to the water bowl.';
    }
    return 'Bestie, the litter-ally bare minimum is not enough. '
        'Time to check your rest, meals, movement, and self-care.';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
