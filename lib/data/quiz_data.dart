
import '../models/quiz_question.dart';

class QuizData {
  QuizData._();

  static const List<QuizQuestion> questions = [
    QuizQuestion(
      id: 'q1',
      question: 'You spot a tiny mouse while exploring the house. What do you do?',
      options: [
        'Pounce dramatically! Watch my royal hunting skills.',
        'Chase it like a little chaos machine!',
        'Watch silently from the shadows.',
        'Observe it carefully before making a move.',
      ],
      answerPersonalities: [
        CatPersonality.princess,
        CatPersonality.orange,
        CatPersonality.black,
        CatPersonality.curious,
      ],
      energyScores: [3, 4, 1, 3],
    ),
    QuizQuestion(
      id: 'q2',
      question: 'Your human is sitting on the sofa. Where do you settle?',
      options: [
        'Right on their lap. I deserve attention.',
        'Somewhere completely unexpected!',
        'Nearby, but not too close.',
        'On the highest spot so I can watch everything.',
      ],
      answerPersonalities: [
        CatPersonality.princess,
        CatPersonality.orange,
        CatPersonality.black,
        CatPersonality.curious,
      ],
      energyScores: [2, 4, 1, 3],
    ),
    QuizQuestion(
      id: 'q3',
      question: 'Your human brings home a brand-new toy. What do you do?',
      options: [
        'Play with it dramatically until everyone watches me.',
        'Attack it immediately! No thoughts, just paws.',
        'Inspect it quietly from a distance.',
        'Investigate every little detail.',
      ],
      answerPersonalities: [
        CatPersonality.princess,
        CatPersonality.orange,
        CatPersonality.black,
        CatPersonality.curious,
      ],
      energyScores: [3, 4, 1, 3],
    ),
    QuizQuestion(
      id: 'q4',
      question: 'A stranger enters your territory. What is your reaction?',
      options: [
        'Approach confidently and demand admiration.',
        'Run around them and cause chaos.',
        'Disappear into my favorite hiding spot.',
        'Watch them carefully from a secret corner.',
      ],
      answerPersonalities: [
        CatPersonality.princess,
        CatPersonality.orange,
        CatPersonality.black,
        CatPersonality.curious,
      ],
      energyScores: [3, 4, 1, 2],
    ),
    QuizQuestion(
      id: 'q5',
      question: 'Your food bowl is empty. How do you react?',
      options: [
        'Meow politely until my human notices.',
        'Knock something over to get attention.',
        'Wait quietly for the right moment.',
        'Investigate the kitchen for possible snacks.',
      ],
      answerPersonalities: [
        CatPersonality.princess,
        CatPersonality.orange,
        CatPersonality.black,
        CatPersonality.curious,
      ],
      energyScores: [2, 4, 1, 3],
    ),
    QuizQuestion(
      id: 'q6',
      question: 'Where would you choose to take your afternoon nap?',
      options: [
        'On a soft pillow fit for royalty.',
        'Inside a random box that is too small.',
        'In a dark, quiet corner all by myself.',
        'Somewhere new where I can observe everything.',
      ],
      answerPersonalities: [
        CatPersonality.princess,
        CatPersonality.orange,
        CatPersonality.black,
        CatPersonality.sleepy,
      ],
      energyScores: [1, 2, 1, 1],
    ),
    QuizQuestion(
      id: 'q7',
      question: 'Your human tries to give you a bath. What happens?',
      options: [
        'I expect a luxurious spa experience!',
        'I turn the bathroom into a disaster zone.',
        'I silently plan my escape.',
        'I investigate the water before deciding.',
      ],
      answerPersonalities: [
        CatPersonality.princess,
        CatPersonality.orange,
        CatPersonality.black,
        CatPersonality.curious,
      ],
      energyScores: [2, 4, 2, 3],
    ),
    QuizQuestion(
      id: 'q8',
      question: 'Your human calls your name. What do you do?',
      options: [
        'Come over because I love being adored.',
        'Run toward them at full speed!',
        'Pretend I did not hear anything.',
        'Look around to figure out why they called me.',
      ],
      answerPersonalities: [
        CatPersonality.princess,
        CatPersonality.orange,
        CatPersonality.black,
        CatPersonality.curious,
      ],
      energyScores: [2, 4, 1, 3],
    ),
    QuizQuestion(
      id: 'q9',
      question: 'You discover a mysterious closed door. What is your next move?',
      options: [
        'Meow until someone opens it for me.',
        'Scratch it dramatically and demand entry.',
        'Sit quietly and wait for the perfect moment.',
        'Investigate every corner around the door.',
      ],
      answerPersonalities: [
        CatPersonality.princess,
        CatPersonality.orange,
        CatPersonality.black,
        CatPersonality.curious,
      ],
      energyScores: [2, 4, 1, 3],
    ),
    QuizQuestion(
      id: 'q10',
      question: 'How do you show your human that you love them?',
      options: [
        'Demand cuddles and all their attention.',
        'Playfully bite their hand and run away.',
        'Sit beside them quietly.',
        'Follow them everywhere to see what they are doing.',
      ],
      answerPersonalities: [
        CatPersonality.princess,
        CatPersonality.orange,
        CatPersonality.black,
        CatPersonality.curious,
      ],
      energyScores: [2, 4, 1, 3],
    ),
    QuizQuestion(
      id: 'q11',
      question: 'It is raining outside. What sounds best?',
      options: [
        'Curl up on a fluffy blanket like royalty.',
        'Chase raindrops through the window.',
        'Find a quiet and cozy sleeping spot.',
        'Watch the rain and everything moving outside.',
      ],
      answerPersonalities: [
        CatPersonality.princess,
        CatPersonality.orange,
        CatPersonality.sleepy,
        CatPersonality.curious,
      ],
      energyScores: [1, 3, 1, 2],
    ),
    QuizQuestion(
      id: 'q12',
      question: 'Your human is busy working. What do you do?',
      options: [
        'Sit on their keyboard. I am the priority.',
        'Run around the room looking for fun.',
        'Sleep peacefully until they are available.',
        'Explore everything on their desk.',
      ],
      answerPersonalities: [
        CatPersonality.princess,
        CatPersonality.orange,
        CatPersonality.sleepy,
        CatPersonality.curious,
      ],
      energyScores: [3, 4, 1, 3],
    ),
    QuizQuestion(
      id: 'q13',
      question: 'What is your favorite way to spend a lazy day?',
      options: [
        'Being pampered and getting belly rubs.',
        'Turning the house into my playground.',
        'Sleeping for approximately 18 hours.',
        'Exploring every tiny corner of the house.',
      ],
      answerPersonalities: [
        CatPersonality.princess,
        CatPersonality.orange,
        CatPersonality.sleepy,
        CatPersonality.curious,
      ],
      energyScores: [2, 4, 1, 3],
    ),
    QuizQuestion(
      id: 'q14',
      question: 'You hear a strange noise in the middle of the night. What do you do?',
      options: [
        'Wake my human up to investigate it for me.',
        'Sprint around the house at maximum speed.',
        'Stay in bed. Sleep is more important.',
        'Sneak around to discover where it came from.',
      ],
      answerPersonalities: [
        CatPersonality.princess,
        CatPersonality.orange,
        CatPersonality.sleepy,
        CatPersonality.curious,
      ],
      energyScores: [2, 4, 1, 3],
    ),
    QuizQuestion(
      id: 'q15',
      question: 'If you could choose your perfect cat life, what would it be?',
      options: [
        'A palace, endless treats, and loyal servants.',
        'Endless adventures, zoomies, and playful chaos.',
        'A cozy bed, warm sunlight, and uninterrupted naps.',
        'A huge world full of mysteries to explore.',
      ],
      answerPersonalities: [
        CatPersonality.princess,
        CatPersonality.orange,
        CatPersonality.sleepy,
        CatPersonality.curious,
      ],
      energyScores: [2, 4, 1, 3],
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

  static int get minPossibleScore => minimumPossibleScore;

  static int get maxPossibleScore => maximumPossibleScore;

  static bool get areQuestionsValid {
    if (questions.length != 15) {
      return false;
    }

    final ids = questions.map((question) => question.id).toSet();

    return ids.length == questions.length &&
        questions.every((question) => question.isValid);
  }
}
