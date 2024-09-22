import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart';  // Import url_launcher package
import 'package:url_launcher/url_launcher_string.dart';  // For handling URLs as strings

class EntertainmentScreen extends StatelessWidget {
  const EntertainmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Increase Your Knowledge',style: TextStyle(fontSize: 18),).tr(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle(context, 'Movie Recommendations'),
            buildCarousel([
              {'title': 'The Shawshank Redemption', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'The Godfather', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'The Dark Knight', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Pulp Fiction', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Forrest Gump', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Inception', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'The Matrix', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Fight Club', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'The Lord of the Rings: The Return of the King', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Forrest Gump', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},

            ]),
            const SizedBox(height: 20),
            buildSectionTitle(context, 'Series Recommendations'),
            buildCarousel([
              {'title': 'Movie 1', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Movie 1', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Movie 1', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Movie 1', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Movie 1', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},

            ]),
            const SizedBox(height: 20),
            buildSectionTitle(context, 'Book Recommendations'),
            buildCarousel([
              {'title': 'Movie 1', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Movie 1', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Movie 1', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Movie 1', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Movie 1', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
            ]),
            const SizedBox(height: 20),
            buildSectionTitle(context, 'Music Recommendations'),
            buildCarousel([
              {'title': 'Movie 1', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Movie 1', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Movie 1', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Movie 1', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Movie 1', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},

            ]),
            const SizedBox(height: 20),
            buildSectionTitle(context, 'YouTube Videos'),
            buildCarousel([
              {'title': 'learn english in 30 minutes', 'image': 'assets/images/background.jpeg', 'link': 'https://youtu.be/sslQioep4s0?si=ukKBkN5cVQzf3r6G'},
              {'title': 'Movie 1', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Movie 1', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Movie 1', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},
              {'title': 'Movie 1', 'image': 'assets/images/background.jpeg', 'link': 'https://www.imdb.com/title/tt0111161/'},

            ]),
          ],
        ),
      ),
    );
  }

  // Function to build a section title
  Widget buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
      ).tr(),
    );
  }

  // Function to build the interactive carousel
  Widget buildCarousel(List<Map<String, String>> items) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 200,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      itemCount: items.length,
      itemBuilder: (context, index, realIndex) {
        final item = items[index];
        return buildCarouselItem(item['image']!, item['title']!, item['link']!);
      },
    );
  }

  // Function to build each carousel item with a clickable link
  Widget buildCarouselItem(String imagePath, String title, String link) {
    return GestureDetector(
      onTap: () => _launchURL(link),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // Function to launch URL
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url); // Convert string to Uri
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);  // Open in external application
    } else {
      throw 'Could not launch $url';
    }
  }
}
