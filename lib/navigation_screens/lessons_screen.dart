import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_projects/lessons_screens/beginner/alphabet_screen.dart';
import 'package:flutter_projects/lessons_screens/beginner/colors_screen.dart';
import 'package:flutter_projects/lessons_screens/beginner/digits_screen.dart';
import 'package:flutter_projects/lessons_screens/intermediate/pronouns_and_prepositions_screen.dart';
import 'package:flutter_projects/lessons_screens/intermediate/simple_sentences.dart';
import '../lessons_screens/advanced/conditional_screen.dart';
import '../lessons_screens/advanced/past_simple_tense_screen.dart';
import '../lessons_screens/advanced/present_simple_tense_screen.dart';
import '../lessons_screens/advanced/reported_speech_screen.dart';
import '../lessons_screens/intermediate/basic_greetings.dart';
import '../lessons_screens/beginner/basic_vocabulary.dart';
import '../lessons_screens/intermediate/everyday_conversations_screen.dart';

// Main Lessons Page
class Lessons extends StatelessWidget {
  const Lessons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lessons').tr(),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Opacity(
              opacity: 1, // Set opacity to make the background less prominent
              child: Image.asset(
                'assets/images/backkground.jpeg', // Add your background image path
                fit: BoxFit.cover, // Ensure the image covers the whole screen
              ),
            ),
          ),
          // Main content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Beginner Section
                  Center(
                    child: const Text(
                      '"Beginner"',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black),
                    ).tr(),
                  ),
                  const SizedBox(height: 10),
                  buildLessonRow(context, [
                    LessonData(
                      title: 'Alphabet & Phonics',
                      description: 'Learn the English alphabet and basic sounds.',
                      image: 'assets/images/cards_background/11.jpeg',
                      screen: AlphabetScreen(),
                    ),
                    LessonData(
                      title: 'Digits',
                      description: 'Learn digits from 1 to 10',
                      image: 'assets/images/cards_background/11.jpeg',
                      screen: DigitsScreen(),
                    ),
                    LessonData(
                      title: 'Colors',
                      description: 'Know more about colors',
                      image: 'assets/images/cards_background/11.jpeg',
                      screen: ColorsScreen(),
                    ),
                    LessonData(
                      title: 'Basic Vocabulary',
                      description: 'Learn everyday words like colors, numbers, and more.',
                      image: 'assets/images/cards_background/11.jpeg',
                      screen: BasicVocabularyScreen(),
                    ),
                  ]),

                  const SizedBox(height: 20),

                  // Intermediate Section
                  Center(
                    child: const Text(
                      '"Intermediate"',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black),
                    ).tr(),
                  ),
                  const SizedBox(height: 10),
                  buildLessonRow(context, [
                    LessonData(
                      title: 'Basic Greetings',
                      description: 'Common phrases like "Hello" and "How are you?".',
                      image: 'assets/images/cards_background/10.jpeg',
                      screen: BasicGreetingsScreen(),
                    ),
                    LessonData(
                      title: 'Simple Sentences',
                      description: 'Understanding simple sentence structures.',
                      image: 'assets/images/cards_background/10.jpeg',
                      screen: SimpleSentencesScreen(),
                    ),
                    LessonData(
                      title: 'Pronouns & Prepositions',
                      description: 'Learn how to use pronouns and prepositions properly.',
                      image: 'assets/images/cards_background/10.jpeg',
                      screen: PronounsPrepositionsScreen(),
                    ),
                    LessonData(
                      title: 'Everyday Conversations',
                      description: 'Practice dialogues for common situations.',
                      image: 'assets/images/cards_background/10.jpeg',
                      screen: EverydayConversationsScreen(),
                    ),
                  ]),

                  const SizedBox(height: 20),

                  // Advanced Section
                  Center(
                    child: const Text(
                      '"Advanced"',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black),
                    ).tr(),
                  ),
                  const SizedBox(height: 10),
                  buildLessonRow(context, [
                    LessonData(
                      title: 'Present Simple Tense',
                      description: 'Forming sentences in the present tense.',
                      image: 'assets/images/cards_background/2.jpeg',
                      screen: PresentSimpleTenseScreen(),
                    ),
                    LessonData(
                      title: 'Past Simple Tense',
                      description: 'Understanding and using the past simple tense correctly.',
                      image: 'assets/images/cards_background/2.jpeg',
                      screen: PastTenseScreen(),
                    ),
                    LessonData(
                      title: 'Conditionals',
                      description: 'Learn conditional sentences (if/then).',
                      image: 'assets/images/cards_background/2.jpeg',
                      screen: ConditionalsScreen(),
                    ),
                    LessonData(
                      title: 'Reported Speech',
                      description: 'How to report what others have said.',
                      image: 'assets/images/cards_background/2.jpeg',
                      screen: ReportedSpeechScreen(),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ],
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
        child: Stack(
          children: [
            // Background image for the card
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Opacity(
                opacity: 0.9,
                child: Image.asset(
                  lesson.image,
                  width: double.infinity, // Make sure the image covers the card
                  height: 120, // Set a fixed height for the card
                  fit: BoxFit.cover, // Ensure the image covers the entire card area
                ),
              ),
            ),
            // Overlay content on the image (title and description)
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black.withOpacity(0.4), // Add a dark overlay to improve text readability
              ),
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          lesson.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // White color for better contrast
                          ),
                        ).tr(),
                        const SizedBox(height: 4),
                        Text(
                          lesson.description,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white, // Slightly dimmed white text
                          ),
                        ).tr(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
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
