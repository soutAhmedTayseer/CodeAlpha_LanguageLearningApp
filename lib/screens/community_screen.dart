import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: const Text(
          'Screen 3',
          style: TextStyle(fontSize: 30),
        ).tr(),
      ),
    );
  }
}