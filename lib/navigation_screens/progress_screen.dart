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
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),

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
}
