import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class S2 extends StatelessWidget {
  const S2({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: const Text(
          'Screen 2',
          style: TextStyle(fontSize: 30),
        ).tr(),
      ),
    );
  }
}