import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ColorsScreen extends StatelessWidget {
  final List<Map<String, String>> colors = [
    {'name': 'Red', 'code': Colors.red.value.toString(), 'sound': 'sounds/colors/red.mp3'},
    {'name': 'Green', 'code': Colors.green.value.toString(), 'sound': 'sounds/colors/green.mp3'},
    {'name': 'Blue', 'code': Colors.blue.value.toString(), 'sound': 'sounds/colors/blue.mp3'},
    {'name': 'Yellow', 'code': Colors.yellow.value.toString(), 'sound': 'sounds/colors/yellow.mp3'},
    {'name': 'Orange', 'code': Colors.orange.value.toString(), 'sound': 'sounds/colors/orange.mp3'},
    {'name': 'Purple', 'code': Colors.purple.value.toString(), 'sound': 'sounds/colors/purple.mp3'},
  ];

  ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Colors'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two cards per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: colors.length,
          itemBuilder: (context, index) {
            final colorInfo = colors[index];
            final colorName = colorInfo['name']!;
            final colorCode = Color(int.parse(colorInfo['code']!));
            final soundPath = colorInfo['sound']!;

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ColorDetailScreen(
                      colorName: colorName,
                      soundPath: soundPath,
                      colorCode: colorCode,
                    ),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                color: colorCode,
                child: Center(
                  child: Text(
                    colorName,
                    style: const TextStyle(
                      fontSize: 24,
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

class ColorDetailScreen extends StatelessWidget {
  final String colorName;
  final String soundPath;
  final Color colorCode;

  const ColorDetailScreen({
    super.key,
    required this.colorName,
    required this.soundPath,
    required this.colorCode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                color: colorCode,
                child: Center(
                  child: Text(
                    colorName,
                    style: const TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
