import '../models/quiz_question.dart';

class QuizData {
  QuizData._();

  static const List<QuizQuestion> questions = [
    QuizQuestion(
      id: 'q1',
      question: 'You spot a mouse during your afternoon nap. What do you do?',
      options: [
        'Chase it immediately!',
        'Watch it from a safe distance.',
        'Try to make friends with it.',
        'Keep napping. Not my problem.',
      ],
      scores: [4, 3, 2, 1],
    ),
    QuizQuestion(
      id: 'q2',
      question: 'Your favorite sunny spot is suddenly occupied. You...',
      options: [
        'Find another cozy place.',
        'Wait patiently for your turn.',
        'Feel annoyed but walk away.',
        'Refuse to move and sulk.',
      ],
      scores: [4, 3, 2, 1],
    ),
    QuizQuestion(
      id: 'q3',
      question: 'How do you usually react to a new toy?',
      options: [
        'Play with it enthusiastically.',
        'Inspect it before playing.',
        'Maybe later. I need a break.',
        'Ignore it completely.',
      ],
      scores: [4, 3, 2, 1],
    ),
    QuizQuestion(
      id: 'q4',
      question: 'A friend invites you to hang out. What is your reaction?',
      options: [
        'Absolutely! Let us have fun.',
        'I will join if I have enough energy.',
        'I would rather stay in today.',
        'I avoid everyone for now.',
      ],
      scores: [4, 3, 2, 1],
    ),
    QuizQuestion(
      id: 'q5',
      question: 'You make a little mistake. What do you tell yourself?',
      options: [
        'It happens. I can try again.',
        'I will learn from this.',
        'I should have done better.',
        'I always mess things up.',
      ],
      scores: [4, 3, 2, 1],
    ),
    QuizQuestion(
      id: 'q6',
      question: 'How does a change in your daily routine feel?',
      options: [
        'Exciting! Something new.',
        'A little strange, but manageable.',
        'I need time to adjust.',
        'It makes me feel overwhelmed.',
      ],
      scores: [4, 3, 2, 1],
    ),
    QuizQuestion(
      id: 'q7',
      question: 'You have had a long day. What sounds best?',
      options: [
        'Play, stretch, and enjoy my evening.',
        'Have a snack and relax.',
        'Hide under a blanket for a while.',
        'Cancel everything and shut down.',
      ],
      scores: [4, 3, 2, 1],
    ),
    QuizQuestion(
      id: 'q8',
      question: 'Someone gives you a genuine compliment. You...',
      options: [
        'Smile and accept it.',
        'Say thank you, even if I feel shy.',
        'Wonder if they really mean it.',
        'Think they are just being polite.',
      ],
      scores: [4, 3, 2, 1],
    ),
    QuizQuestion(
      id: 'q9',
      question: 'When something worries you, what do you usually do?',
      options: [
        'Think it through and find a solution.',
        'Talk to someone I trust.',
        'Keep busy to avoid thinking about it.',
        'Keep it all to myself.',
      ],
      scores: [4, 4, 2, 1],
    ),
    QuizQuestion(
      id: 'q10',
      question: 'How often do you make time for things you enjoy?',
      options: [
        'Regularly. It is part of my routine.',
        'Whenever I can.',
        'Not as often as I would like.',
        'I have almost stopped doing them.',
      ],
      scores: [4, 3, 2, 1],
    ),
    QuizQuestion(
      id: 'q11',
      question: 'When plans do not work out, you...',
      options: [
        'Adjust and look for another option.',
        'Feel disappointed, then move on.',
        'Need a little time to feel okay.',
        'Feel like the whole day is ruined.',
      ],
      scores: [4, 3, 2, 1],
    ),
    QuizQuestion(
      id: 'q12',
      question: 'What do you do when you feel emotionally tired?',
      options: [
        'Rest and do something comforting.',
        'Take a break, then return to things.',
        'Push through even when exhausted.',
        'Ignore my needs until I cannot anymore.',
      ],
      scores: [4, 4, 2, 1],
    ),
    QuizQuestion(
      id: 'q13',
      question: 'How comfortable are you asking for help?',
      options: [
        'Comfortable. Everyone needs help sometimes.',
        'A little awkward, but I can do it.',
        'I usually try to handle everything alone.',
        'I feel like I should never need help.',
      ],
      scores: [4, 3, 2, 1],
    ),
    QuizQuestion(
      id: 'q14',
      question: 'When you have free time, what happens?',
      options: [
        'I enjoy it without feeling guilty.',
        'I relax after finishing important things.',
        'I keep thinking about what I should do.',
        'I cannot seem to switch off my worries.',
      ],
      scores: [4, 3, 2, 1],
    ),
    QuizQuestion(
      id: 'q15',
      question: 'If your inner cat could ask for one thing today, it would be...',
      options: [
        'More adventures and joyful moments!',
        'A balanced day with fun and rest.',
        'A peaceful place to recharge.',
        'Comfort, kindness, and someone to listen.',
      ],
      scores: [4, 3, 2, 1],
    ),
  ];

  static int get questionCount => questions.length;

  static int get minimumPossibleScore =>
      questions.fold(0, (total, question) {
        return total + question.minScore;
      });

  static int get maximumPossibleScore =>
      questions.fold(0, (total, question) {
        return total + question.maxScore;
      });

  static bool get areQuestionsValid {
    if (questions.length != 15) {
      return false;
    }

    final ids = questions.map((question) => question.id).toSet();

    return ids.length == questions.length &&
        questions.every((question) => question.isValid);
  }
}
