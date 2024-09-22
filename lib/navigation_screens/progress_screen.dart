import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Progress extends StatefulWidget {
  const Progress({super.key});

  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  List<String> progressLessons = [];
  List<String> achievementLessons = [];

  @override
  void initState() {
    super.initState();
    loadProgressAndAchievements();
  }

  // Load the progress and achievements from SharedPreferences
  void loadProgressAndAchievements() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      progressLessons = prefs.getStringList('progress_lessons') ?? [];
      achievementLessons = prefs.getStringList('achievement_lessons') ?? [];
    });
  }

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
            Text(
              'In Progress',
              style: Theme.of(context).textTheme.titleLarge,
            ).tr(),
            const SizedBox(height: 10),
            buildProgressList(progressLessons, 'No lessons in progress yet.'),

            const SizedBox(height: 30),

            Text(
              'Achievements',
              style: Theme.of(context).textTheme.titleLarge,
            ).tr(),
            const SizedBox(height: 10),
            buildAchievementList(achievementLessons, 'No completed lessons yet.'),
          ],
        ),
      ),
    );
  }

  // Helper function to build the progress list
  Widget buildProgressList(List<String> lessons, String emptyMessage) {
    if (lessons.isEmpty) {
      return Text(emptyMessage).tr();
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.work_outline),
          title: Text(lessons[index]),
        );
      },
    );
  }

  // Helper function to build the achievement list
  Widget buildAchievementList(List<String> lessons, String emptyMessage) {
    if (lessons.isEmpty) {
      return Text(emptyMessage).tr();
    }

    return ListView.builder(
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (context, index) {
      return ListTile(
          leading: const Icon(Icons.emoji_events_outlined),
        title: Text(lessons[index]),
      );
        },
    );
  }
}

