
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/screens/result_screen.dart';

class QuizResult {
  final String title;
  final int score;
  final int totalQuestions;
  final Map<int, String?> selectedAnswers;
  final Map<int, String?> correctAnswers;

  QuizResult({
    required this.title,
    required this.score,
    required this.totalQuestions,
    required this.selectedAnswers,
    required this.correctAnswers,
  });
}

class ResultsListScreen extends StatelessWidget {
  final List<QuizResult> quizResults;

  const ResultsListScreen({required this.quizResults, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Quiz Results'),
      ),
      body: ListView.builder(
        itemCount: quizResults.length,
        itemBuilder: (context, index) {
          final result = quizResults[index];

          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(result.title),
              subtitle: Text('Score: ${result.score} / ${result.totalQuestions}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      score: result.score,
                      totalQuestions: result.totalQuestions,
                      selectedAnswers: result.selectedAnswers,
                      correctAnswers: result.correctAnswers,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}