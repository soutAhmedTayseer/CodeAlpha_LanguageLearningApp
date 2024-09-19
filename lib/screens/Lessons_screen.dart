import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Lessons extends StatelessWidget {
  const Lessons({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: const Text(
          'Screen 1',
          style: TextStyle(fontSize: 30),
        ).tr(),
      ),
    );
  }
}