import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package
import 'package:url_launcher/url_launcher_string.dart'; // For handling URLs as strings

class EntertainmentScreen extends StatelessWidget {
  const EntertainmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Empower Your Language',
          style: TextStyle(fontSize: 18),
        ).tr(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle(context, 'Movie Recommendations'),
            buildCarousel([
              {
                'title': 'The Shawshank Redemption',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt0111161/'
              },
              {
                'title': 'The Godfather',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt0068646/'
              },
              {
                'title': 'The Dark Knight',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt0468569/'
              },
              {
                'title': 'See You On Venus',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt14960612/'
              },
              {
                'title': 'Forrest Gump',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt0109830/'
              },
              {
                'title': 'Inception',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt1375666/'
              },
              {
                'title': 'The Matrix',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt0133093/'
              },
              {
                'title': 'Fight Club',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt0137523/'
              },
              {
                'title': 'The Lord of the Rings: The Return of the King',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt0167260/'
              },
              {
                'title': 'La La Land',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt3783958/'
              },
            ]),
            const SizedBox(height: 20),
            buildSectionTitle(context, 'Series Recommendations'),
            buildCarousel([
              {
                'title': 'Friends',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt0108778/'
              },
              {
                'title': 'Breaking Bad',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt0903747/'
              },
              {
                'title': 'Game of Thrones',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt0944947/'
              },
              {
                'title': 'The Crown',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt4786824/'
              },
              {
                'title': 'Stranger Things',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt4574334/'
              },
              {
                'title': 'Sherlock',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt1475582/'
              },
              {
                'title': 'The Office',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt0386676/'
              },
              {
                'title': 'Narcos',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt2707408/'
              },
              {
                'title': 'The Witcher',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt5180504/'
              },
              {
                'title': 'Westworld',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.imdb.com/title/tt0475784/'
              },
            ]),
            const SizedBox(height: 20),
            buildSectionTitle(context, 'Book Recommendations'),
            buildCarousel([
              {
                'title': 'To Kill a Mockingbird',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.goodreads.com/book/show/2657.To_Kill_a_Mockingbird'
              },
              {
                'title': '1984 by George Orwell',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.goodreads.com/book/show/5470.1984'
              },
              {
                'title': 'Pride and Prejudice',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.goodreads.com/book/show/1885.Pride_and_Prejudice'
              },
              {
                'title': 'The Great Gatsby',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.goodreads.com/book/show/4671.The_Great_Gatsby'
              },
              {
                'title': 'Moby-Dick',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.goodreads.com/book/show/153747.Moby_Dick'
              },
              {
                'title': 'War and Peace',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.goodreads.com/book/show/656.War_and_Peace'
              },
              {
                'title': 'The Catcher in the Rye',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.goodreads.com/book/show/5107.The_Catcher_in_the_Rye'
              },
              {
                'title': 'Brave New World',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.goodreads.com/book/show/5129.Brave_New_World'
              },
              {
                'title': 'The Alchemist',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.goodreads.com/book/show/865.The_Alchemist'
              },
              {
                'title': 'The Hobbit',
                'image': 'assets/images/background.jpeg',
                'link': 'https://www.goodreads.com/book/show/5907.The_Hobbit'
              },
            ]),
            const SizedBox(height: 20),
            buildSectionTitle(context, 'Music Recommendations'),
            buildCarousel([
              {
                'title': 'Shape of You - Ed Sheeran',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/JGwWNGJdvx8'
              },
              {
                'title': 'Someone Like You - Adele',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/hLQl3WQQoQ0'
              },
              {
                'title': 'Blinding Lights - The Weeknd',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/fHI8X4OXluQ'
              },
              {
                'title': 'Bad Guy - Billie Eilish',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/DyDfgMOUjCI'
              },
              {
                'title': 'Uptown Funk - Mark Ronson ft. Bruno Mars',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/OPf0YbXqDm0'
              },
              {
                'title': 'Perfect - Ed Sheeran',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/2Vv-BfVoq4g'
              },
              {
                'title': 'Rolling in the Deep - Adele',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/rYEDA3JcQqw'
              },
              {
                'title': 'Let Her Go - Passenger',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/RBumgq5yVrA'
              },
              {
                'title': 'Havana - Camila Cabello',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/BQ0mxQXmLsk'
              },
              {
                'title': 'Love Me Like You Do - Ellie Goulding',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/AJtDXIazrMo'
              },
            ]),
            const SizedBox(height: 20),
            buildSectionTitle(context, 'Learn English YouTube Videos'),
            buildCarousel([
              {
                'title': 'Learn English in 30 Minutes - ALL the English Basics You Need',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/d0rWLpP6AkY'
              },
              {
                'title': 'Learn English Through Story - The Stranger',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/27m1L6uIuVs'
              },
              {
                'title': 'BBC Learning English - Tim’s Pronunciation Workshop',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/DQLhdPRsPW8'
              },
              {
                'title': 'Learn English with TV Series',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/kRfvp5cS0z0'
              },
              {
                'title': 'English Conversation Practice',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/5WzD5fyCA5M'
              },
              {
                'title': 'English Listening Practice',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/HD4eJj6tT8k'
              },
              {
                'title': 'Speak English Like a Native',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/0Tzj8yvFKeo'
              },
              {
                'title': 'English Pronunciation Tutorial',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/oP0kRv5e-0M'
              },
              {
                'title': 'Learn English Vocabulary',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/P8GkjW08tRA'
              },
              {
                'title': 'English Grammar for Beginners',
                'image': 'assets/images/background.jpeg',
                'link': 'https://youtu.be/JvVkmzOnXdg'
              },
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
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.bold),
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
      await launchUrl(uri,
          mode: LaunchMode.externalApplication); // Open in external application
    } else {
      throw 'Could not launch $url';
    }
  }
}
