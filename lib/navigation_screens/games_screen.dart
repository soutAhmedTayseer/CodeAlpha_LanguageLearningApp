import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_projects/screens/list_of_gimified_q_and_a.dart';

class CategorySelectionScreen extends StatelessWidget {
  const CategorySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Gamified Experience',style: TextStyle(fontSize: 18),)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CategoryButton(
              categoryName: 'Animals',
              questions: getAnimalQuestions(),
            ),
            CategoryButton(
              categoryName: 'Colors',
              questions: getColorQuestions(),
            ),
            CategoryButton(
              categoryName: 'Numbers',
              questions: getNumberQuestions(),
            ),
            CategoryButton(
              categoryName: 'Shapes',
              questions: getShapeQuestions(),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String categoryName;
  final List<Question> questions;

  const CategoryButton({super.key, required this.categoryName, required this.questions});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => QuizScreen(questions: questions),
              ),
            );
          },
          child: Text('Start $categoryName Quiz'),
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  final List<Question> questions;

  const QuizScreen({super.key, required this.questions});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  // Play the sound of the current question
  void playSound(String path) async {
    await audioPlayer.play(AssetSource(path));
  }

  // When user selects an image
  void selectAnswer(int selectedIndex) {
    if (selectedIndex == widget.questions[currentQuestionIndex].correctAnswerIndex) {
      score++;
    }

    if (currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // When all questions are answered, show the dialog
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Yeeeeah, you did it!'),
          content: Text('Your score is $score out of ${widget.questions.length}.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Return to category selection
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Question ${currentQuestionIndex + 1} of ${widget.questions.length}',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              IconButton(
                icon: const Icon(Icons.volume_up, size: 40),
                onPressed: () {
                  playSound(widget.questions[currentQuestionIndex].soundPath);
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Display the two image options
                  GestureDetector(
                    onTap: () => selectAnswer(0),
                    child: Image.asset(
                      widget.questions[currentQuestionIndex].options[0],
                      width: 150,
                      height: 150,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectAnswer(1),
                    child: Image.asset(
                      widget.questions[currentQuestionIndex].options[1],
                      width: 150,
                      height: 150,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Question class that holds the data
class Question {
  final String soundPath;
  final List<String> options;
  final int correctAnswerIndex;

  Question({
    required this.soundPath,
    required this.options,
    required this.correctAnswerIndex,
  });
}

