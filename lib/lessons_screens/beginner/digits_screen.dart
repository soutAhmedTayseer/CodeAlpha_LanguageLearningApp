import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class DigitsScreen extends StatelessWidget {
  final List<Map<String, String>> digits = List.generate(
    10,
    (index) => {
      'digit': '${index + 1}', // Generates digits 1-10
      'word': [
        'One',
        'Two',
        'Three',
        'Four',
        'Five',
        'Six',
        'Seven',
        'Eight',
        'Nine',
        'Ten'
      ][index], // Word representation
      'sound': 'sounds/digits/${index + 1}.mp3' // Adjust path as necessary
    },
  );

  DigitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Digits'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Three cards per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: digits.length,
          itemBuilder: (context, index) {
            final digit = digits[index]['digit']!;
            final soundPath = digits[index]['sound']!;
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DigitDetailScreen(
                      digit: digit,
                      word: digits[index]['word']!,
                      soundPath: soundPath,
                    ),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    digit,
                    style: const TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DigitDetailScreen extends StatelessWidget {
  final String digit;
  final String word;
  final String soundPath;

  const DigitDetailScreen({
    super.key,
    required this.digit,
    required this.word,
    required this.soundPath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digit Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                digit,
                style: const TextStyle(
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                word,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              IconButton(
                icon: const Icon(Icons.volume_up, size: 48),
                onPressed: () {
                  _playSound(soundPath);
                },
                color: Colors.blueAccent,
                tooltip: 'Play Sound',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _playSound(String soundPath) async {
    final audioPlayer = AudioPlayer();
    try {
      await audioPlayer.play(AssetSource(soundPath));
    } catch (e) {
      print("Error playing sound: $e");
    }
  }
}
