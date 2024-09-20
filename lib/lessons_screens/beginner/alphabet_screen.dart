import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../management/alphabet_cubit.dart';
import '../../management/alphabet_states.dart';

class AlphabetScreen extends StatelessWidget {
  final List<Map<String, String>> alphabets = List.generate(
    26,
        (index) => {
      'letter': String.fromCharCode(65 + index), // Generates A-Z in uppercase
      'sound': 'sounds/letters/${String.fromCharCode(65 + index)}.mp3'
    },
  );

  AlphabetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alphabet & Phonics'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Four cards per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: alphabets.length,
          itemBuilder: (context, index) {
            final alphabet = alphabets[index]['letter']!;
            final soundPath = alphabets[index]['sound']!;
            return GestureDetector(
              onTap: () {
                context
                    .read<AlphabetCubit>()
                    .selectAlphabet(alphabet, soundPath);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AlphabetDetailPage(),
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
                    alphabet,
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

class AlphabetDetailPage extends StatelessWidget {
  const AlphabetDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alphabet Details'),
      ),
      body: BlocBuilder<AlphabetCubit, AlphabetState>(
        builder: (context, state) {
          if (state is AlphabetSelected) {
            return AlphabetDetailContent(
                alphabet: state.alphabet, soundPath: state.soundPath);
          } else {
            return const Center(child: Text('No Alphabet Selected'));
          }
        },
      ),
    );
  }
}

class AlphabetDetailContent extends StatefulWidget {
  final String alphabet;
  final String soundPath;

  const AlphabetDetailContent({
    super.key,
    required this.alphabet,
    required this.soundPath,
  });

  @override
  _AlphabetDetailContentState createState() => _AlphabetDetailContentState();
}

class _AlphabetDetailContentState extends State<AlphabetDetailContent> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer(); // Initialize the audio player
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Dispose of the player when the widget is removed
    super.dispose();
  }

  void _playSound() async {
    print("Playing sound from: ${widget.soundPath}"); // Debugging line
    try {
      await _audioPlayer.play(AssetSource(widget.soundPath));
    } catch (e) {
      print("Error playing sound: $e");
    }
  }

  String _getLetterType(String letter) {
    const vowels = ['A', 'E', 'I', 'O', 'U'];
    return vowels.contains(letter) ? 'Vowel' : 'Consonant';
  }

  @override
  Widget build(BuildContext context) {
    final letterType = _getLetterType(widget.alphabet);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.alphabet,
              style: const TextStyle(
                fontSize: 120,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'This letter is a $letterType',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            IconButton(
              icon: const Icon(Icons.volume_up, size: 48),
              onPressed: _playSound,
              tooltip: 'Play Sound',
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
