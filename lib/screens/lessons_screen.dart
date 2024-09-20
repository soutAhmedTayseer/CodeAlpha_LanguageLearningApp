import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_projects/lessons_screens/alphabet_screen.dart';
import 'package:flutter_projects/lessons_screens/simple_sentences.dart';
import '../lessons_screens/basic_greetings.dart';
import '../lessons_screens/basic_vocabulary.dart';

// Main Lessons Page
class Lessons extends StatelessWidget {
  const Lessons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lessons').tr(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Beginner Section
              const Text(
                'Beginner',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ).tr(),
              const SizedBox(height: 10),
              buildLessonRow(context, [
                LessonData(
                  title: 'Alphabet & Phonics',
                  description: 'Learn the English alphabet and basic sounds.',
                  image: 'assets/images/background.jpeg',
                  screen:  AlphabetScreen(),
                ),
                LessonData(
                  title: 'Basic Greetings',
                  description: 'Common phrases like "Hello" and "How are you?".',
                  image: 'assets/images/background.jpeg',
                  screen:  BasicGreetingsScreen(), // Navigation target
                ),
                LessonData(
                  title: 'Simple Sentences',
                  description: 'Understanding simple sentence structures.',
                  image: 'assets/images/background.jpeg',
                  screen:  SimpleSentencesScreen(), // Navigation target
                ),
                LessonData(
                  title: 'Basic Vocabulary',
                  description:
                  'Learn everyday words like colors, numbers, and more.',
                  image: 'assets/images/background.jpeg',
                  screen:  BasicVocabularyScreen(), // Navigation target
                ),
              ]),

              const SizedBox(height: 20),

              // Intermediate Section
              const Text(
                'Intermediate',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ).tr(),
              const SizedBox(height: 10),
              buildLessonRow(context, [
                LessonData(
                  title: 'Present Simple Tense',
                  description: 'Forming sentences in the present tense.',
                  image: 'assets/images/background.jpeg',
                  screen: const PresentSimpleTenseScreen(), // Navigation target
                ),
                LessonData(
                  title: 'Everyday Conversations',
                  description: 'Practice dialogues for common situations.',
                  image: 'assets/images/background.jpeg',
                  screen: const EverydayConversationsScreen(), // Navigation target
                ),
                LessonData(
                  title: 'Past Tense',
                  description: 'Understanding and using the past tense correctly.',
                  image: 'assets/images/background.jpeg',
                  screen: const PastTenseScreen(), // Navigation target
                ),
                LessonData(
                  title: 'Pronouns & Prepositions',
                  description: 'Learn how to use pronouns and prepositions properly.',
                  image: 'assets/images/background.jpeg',
                  screen: const PronounsPrepositionsScreen(), // Navigation target
                ),
              ]),

              const SizedBox(height: 20),

              // Advanced Section
              const Text(
                'Advanced',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ).tr(),
              const SizedBox(height: 10),
              buildLessonRow(context, [
                LessonData(
                  title: 'Conditionals',
                  description: 'Learn conditional sentences (if/then).',
                  image: 'assets/images/background.jpeg',
                  screen: const ConditionalsScreen(), // Navigation target
                ),
                LessonData(
                  title: 'Business English',
                  description: 'Advanced vocabulary for professional settings.',
                  image: 'assets/images/background.jpeg',
                  screen: const BusinessEnglishScreen(), // Navigation target
                ),
                LessonData(
                  title: 'Reported Speech',
                  description: 'How to report what others have said.',
                  image: 'assets/images/background.jpeg',
                  screen: const ReportedSpeechScreen(), // Navigation target
                ),
                LessonData(
                  title: 'Complex Grammar',
                  description: 'Master complex sentence structures and nuances.',
                  image: 'assets/images/background.jpeg',
                  screen: const ComplexGrammarScreen(), // Navigation target
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build a row of lesson cards
  Widget buildLessonRow(BuildContext context, List<LessonData> lessons) {
    return Column(
      children:
      lessons.map((lesson) => buildLessonCard(context, lesson)).toList(),
    );
  }

  // Function to build a single lesson card
  Widget buildLessonCard(BuildContext context, LessonData lesson) {
    return GestureDetector(
      onTap: () {
        // Navigate to the specified screen when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => lesson.screen),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Lesson image
              Image.asset(
                lesson.image,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 16),
              // Lesson details (title and description)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ).tr(),
                    const SizedBox(height: 4),
                    Text(
                      lesson.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ).tr(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Data model for a lesson
class LessonData {
  final String title;
  final String description;
  final String image;
  final Widget screen; // Navigation target

  LessonData({
    required this.title,
    required this.description,
    required this.image,
    required this.screen,
  });
}

// Screens for each lesson






class PresentSimpleTenseScreen extends StatelessWidget {
  const PresentSimpleTenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Present Simple Tense').tr(),
      ),
      body: Center(
        child: Text('Present Simple Tense content goes here').tr(),
      ),
    );
  }
}

class EverydayConversationsScreen extends StatelessWidget {
  const EverydayConversationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Everyday Conversations').tr(),
      ),
      body: Center(
        child: Text('Everyday Conversations content goes here').tr(),
      ),
    );
  }
}

class PastTenseScreen extends StatelessWidget {
  const PastTenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Past Tense').tr(),
      ),
      body: Center(
        child: Text('Past Tense content goes here').tr(),
      ),
    );
  }
}

class PronounsPrepositionsScreen extends StatelessWidget {
  const PronounsPrepositionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pronouns & Prepositions').tr(),
      ),
      body: Center(
        child: Text('Pronouns & Prepositions content goes here').tr(),
      ),
    );
  }
}

class ConditionalsScreen extends StatelessWidget {
  const ConditionalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conditionals').tr(),
      ),
      body: Center(
        child: Text('Conditionals content goes here').tr(),
      ),
    );
  }
}

class BusinessEnglishScreen extends StatelessWidget {
  const BusinessEnglishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business English').tr(),
      ),
      body: Center(
        child: Text('Business English content goes here').tr(),
      ),
    );
  }
}

class ReportedSpeechScreen extends StatelessWidget {
  const ReportedSpeechScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reported Speech').tr(),
      ),
      body: Center(
        child: Text('Reported Speech content goes here').tr(),
      ),
    );
  }
}

class ComplexGrammarScreen extends StatelessWidget {
  const ComplexGrammarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex Grammar').tr(),
      ),
      body: Center(
        child: Text('Complex Grammar content goes here').tr(),
      ),
    );
  }
}
