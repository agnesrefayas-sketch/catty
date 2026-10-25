import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/quiz_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => QuizProvider(),
      child: const CattyApp(),
    ),
  );
}

class CattyApp extends StatelessWidget {
  const CattyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, quiz, child) {
        const primaryPink = Color(0xFFFF8FA3);
        const sageGreen = Color(0xFFA8BFA3);

        const lightBackground = Color(0xFFFFF8F5);
        const darkBackground = Color(0xFF17151B);
        const darkSurface = Color(0xFF26232D);
        const lightText = Color(0xFF493D46);
        const darkText = Color(0xFFF7F0F5);

        final isDark = quiz.isDarkMode;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Catty - Purrfectly Okay?',
          theme: ThemeData(
            useMaterial3: true,
            brightness:
            isDark ? Brightness.dark : Brightness.light,
            scaffoldBackgroundColor:
            isDark ? darkBackground : lightBackground,
            colorScheme: ColorScheme.fromSeed(
              seedColor: primaryPink,
              brightness:
              isDark ? Brightness.dark : Brightness.light,
              primary: primaryPink,
              secondary: sageGreen,
              surface: isDark ? darkSurface : Colors.white,
              onSurface: isDark ? darkText : lightText,
            ),
            appBarTheme: AppBarTheme(
              backgroundColor:
              isDark ? darkBackground : lightBackground,
              foregroundColor: isDark ? darkText : lightText,
              elevation: 0,
              centerTitle: true,
            ),
            cardTheme: CardThemeData(
              color: isDark ? darkSurface : Colors.white,
              elevation: 0,
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: isDark ? darkSurface : Colors.white,
              hintStyle: TextStyle(
                color: isDark
                    ? Colors.white54
                    : const Color(0xFF9B8E98),
              ),
            ),
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
