import 'package:flutter/material.dart';

class AnswerOptionCard extends StatelessWidget {
  final String text;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerOptionCard({
    super.key,
    required this.text,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  static const Color primaryColor = Color(0xFFFF8FA3);
  static const Color textColor = Color(0xFF493D46);
  static const Color mutedColor = Color(0xFF9B8E98);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected
          ? const Color(0xFFFFE4EA)
          : Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
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
                  label,
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
                  text,
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
  }
}
