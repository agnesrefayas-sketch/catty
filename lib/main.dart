import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'providers/quiz_provider.dart';

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
    const primaryPink = Color(0xFFF4A7B9);
    const sageGreen = Color(0xFFA8BFA3);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catty - Purrfectly Okay?',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF8F7),
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryPink,
          primary: primaryPink,
          secondary: sageGreen,
          surface: const Color(0xFFFFF8F7),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFF8F7),
          foregroundColor: Color(0xFF493D46),
          elevation: 0,
          centerTitle: true,
        ),
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}
