import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final Map<int, String?> selectedAnswers;
  final Map<int, String?> correctAnswers;

  const ResultScreen({
    required this.score,
    required this.totalQuestions,
    required this.selectedAnswers,
    required this.correctAnswers,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Results').tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Score Card
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Your Score: $score / $totalQuestions',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: selectedAnswers.length,
                itemBuilder: (context, index) {
                  final question = 'Question ${index + 1}'; // Update to show question text if available
                  final selectedAnswer = selectedAnswers[index];
                  final correctAnswer = correctAnswers[index];

                  // Determine text color based on correctness
                  final isCorrect = selectedAnswer == correctAnswer;
                  final answerColor = isCorrect ? Colors.green : Colors.red;

                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            question,
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Your Answer: $selectedAnswer',
                            style: TextStyle(color: answerColor),
                          ),
                          Text(
                            'Correct Answer: $correctAnswer',
                            style: const TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
