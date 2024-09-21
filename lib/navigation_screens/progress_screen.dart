import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress').tr(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Lessons Section
            buildSectionTitle('Progress Lessons', context),
            const SizedBox(height: 10),
            buildProgressLessonsSection(context),
            const SizedBox(height: 30),

            // Achievements Section
            buildSectionTitle('Achievements', context),
            const SizedBox(height: 10),
            buildAchievementsSection(context),
            const SizedBox(height: 30),

            // Done Quizzes Section
            buildSectionTitle('Done Quizzes', context),
            const SizedBox(height: 10),
            buildDoneQuizzesSection(context),
          ],
        ),
      ),
    );
  }

  // Helper method to build section titles
  Widget buildSectionTitle(String title, BuildContext context) {
    return Text(
      title.tr(),
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  // Sample content for Progress Lessons section
  Widget buildProgressLessonsSection(BuildContext context) {
    return Column(
      children: [
        buildProgressCard(context, 'Alphabet & Phonics', 'In Progress'),
        buildProgressCard(context, 'Colors', 'In Progress'),
        buildProgressCard(context, 'Basic Vocabulary', 'In Progress'),
      ],
    );
  }

  // Sample content for Achievements section
  Widget buildAchievementsSection(BuildContext context) {
    return Column(
      children: [
        buildAchievementCard(context, 'Completed 5 Lessons'),
        buildAchievementCard(context, 'Mastered Basic Vocabulary'),
        buildAchievementCard(context, 'First 100 Words Learned'),
      ],
    );
  }

  // Sample content for Done Quizzes section
  Widget buildDoneQuizzesSection(BuildContext context) {
    return Column(
      children: [
        buildQuizCard(context, 'Alphabet Quiz', 85),
        buildQuizCard(context, 'Colors Quiz', 90),
        buildQuizCard(context, 'Vocabulary Quiz', 100),
      ],
    );
  }

  // Helper method to build a progress card
  Widget buildProgressCard(BuildContext context, String lessonTitle, String status) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          lessonTitle.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          status.tr(),
          style: const TextStyle(color: Colors.blueAccent),
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigate to the respective lesson (you can add navigation logic)
        },
      ),
    );
  }

  // Helper method to build an achievement card
  Widget buildAchievementCard(BuildContext context, String achievement) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          achievement.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: const Icon(Icons.emoji_events, color: Colors.amber, size: 40),
      ),
    );
  }

  // Helper method to build a quiz card
  Widget buildQuizCard(BuildContext context, String quizTitle, int score) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          quizTitle.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Score: $score%'.tr(),
          style: const TextStyle(color: Colors.green),
        ),
        leading: const Icon(Icons.quiz, color: Colors.blueAccent, size: 40),
      ),
    );
  }
}
