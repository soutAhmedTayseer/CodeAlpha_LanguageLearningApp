import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_projects/components/background_widget.dart';
import 'package:flutter_projects/components/questions_and_answers.dart';
import 'package:flutter_projects/components/searchbar_widget.dart';

class QuizCategoriesScreenCategoriesScreen extends StatefulWidget {
  const QuizCategoriesScreenCategoriesScreen({super.key});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState
    extends State<QuizCategoriesScreenCategoriesScreen> {
  String searchQuery = ''; // To hold the search query

  @override
  Widget build(BuildContext context) {
    final filteredCategories = categories
        .where((category) =>
            category['title'].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizzes').tr(),
      ),
      body: Stack(
        children: [
          const BackgroundImage(
              imagePath:
                  'assets/images/backkground.jpeg'), // Use BackgroundImage
          Column(
            children: [
              // Search bar at the top
              CustomSearchBar(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),

              // Carousel, constrained to be smaller
              SizedBox(
                height: 220, // Limit the height of the carousel
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.95),
                  itemCount: filteredCategories.length,
                  itemBuilder: (BuildContext context, int index) {
                    final category = filteredCategories[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to QuizScreen when a card is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(
                              categoryTitle: category['title'],
                              questions: category['questions'],
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Transform.scale(
                          scale: 0.9, // Slightly scale the selected card
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: AssetImage(category['image']),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  category['title'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 3.0,
                                        color: Colors.black54,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Padding or additional content below carousel can go here
            ],
          ),
        ],
      ),
    );
  }
}

// QuizScreen to display MCQs

class QuizScreen extends StatefulWidget {
  final String categoryTitle;
  final List<Map<String, dynamic>> questions;

  const QuizScreen(
      {required this.categoryTitle, required this.questions, Key? key})
      : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  final Map<int, String?> selectedAnswers = {};
  late List<String?> currentOptions;
  late String currentQuestion;

  @override
  void initState() {
    super.initState();
    _setCurrentQuestion();
  }

  void _setCurrentQuestion() {
    if (widget.questions.isNotEmpty) {
      currentQuestion = widget.questions[currentQuestionIndex]['question'];
      currentOptions = widget.questions[currentQuestionIndex]['options']
          .cast<String?>()
        ..shuffle();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.questions.isEmpty) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            'No questions available',
            style: TextStyle(color: Colors.orange, fontSize: 20),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryTitle).tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1} of ${widget.questions.length}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              currentQuestion,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Column(
                children: currentOptions.map((option) {
                  return ListTile(
                    title: Text(option!),
                    leading: Radio<String?>(
                      value: option,
                      groupValue: selectedAnswers[currentQuestionIndex],
                      onChanged: (value) {
                        setState(() {
                          selectedAnswers[currentQuestionIndex] = value;
                        });
                      },
                      activeColor: Colors.green,
                    ),
                    onTap: () {
                      setState(() {
                        selectedAnswers[currentQuestionIndex] = option;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (currentQuestionIndex < widget.questions.length - 1) {
                  setState(() {
                    currentQuestionIndex++;
                    _setCurrentQuestion();
                  });
                } else {
                  _submitQuiz();
                }
              },
              child: Text(currentQuestionIndex < widget.questions.length - 1
                      ? 'Next Question'
                      : 'Submit Quiz')
                  .tr(),
            ),
          ],
        ),
      ),
    );
  }

  void _submitQuiz() {
    int score = 0;
    final correctAnswers = <int, String?>{};

    for (int i = 0; i < widget.questions.length; i++) {
      final question = widget.questions[i];
      final selectedAnswer = selectedAnswers[i];
      if (selectedAnswer == question['answer']) {
        score++;
      }
      correctAnswers[i] = question['answer'];
    }

    // Navigate to result screen (implement the result screen)
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => ResultScreen(
    //       score: score,
    //       totalQuestions: widget.questions.length,
    //       selectedAnswers: selectedAnswers,
    //       correctAnswers: correctAnswers,
    //     ),
    //   ),
    // );
  }
}
