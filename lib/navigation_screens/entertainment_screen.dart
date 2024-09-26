import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package

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
                'image': 'assets/images/entertainment/1.jpg',
                'link': 'https://www.imdb.com/title/tt0111161/'
              },
              {
                'title': 'The Godfather',
                'image': 'assets/images/entertainment/2.jpg',
                'link': 'https://www.imdb.com/title/tt0068646/'
              },
              {
                'title': 'The Dark Knight',
                'image': 'assets/images/entertainment/3.jpg',
                'link': 'https://www.imdb.com/title/tt0468569/'
              },
              {
                'title': 'See You On Venus',
                'image': 'assets/images/entertainment/4.jpg',
                'link': 'https://www.imdb.com/title/tt14960612/'
              },
              {
                'title': 'Forrest Gump',
                'image': 'assets/images/entertainment/5.jpg',
                'link': 'https://www.imdb.com/title/tt0109830/'
              },
              {
                'title': 'Inception',
                'image': 'assets/images/entertainment/6.jpg',
                'link': 'https://www.imdb.com/title/tt1375666/'
              },
              {
                'title': 'The Matrix',
                'image': 'assets/images/entertainment/7.jpg',
                'link': 'https://www.imdb.com/title/tt0133093/'
              },
              {
                'title': 'Fight Club',
                'image': 'assets/images/entertainment/8.jpg',
                'link': 'https://www.imdb.com/title/tt0137523/'
              },
              {
                'title': 'The Lord of the Rings: The Return of the King',
                'image': 'assets/images/entertainment/9.jpg',
                'link': 'https://www.imdb.com/title/tt0167260/'
              },
              {
                'title': 'La La Land',
                'image': 'assets/images/entertainment/10.jpg',
                'link': 'https://www.imdb.com/title/tt3783958/'
              },
            ]),
            const SizedBox(height: 20),
            buildSectionTitle(context, 'Series Recommendations'),
            buildCarousel([
              {
                'title': 'Friends',
                'image': 'assets/images/entertainment/11.jpg',
                'link': 'https://www.imdb.com/title/tt0108778/'
              },
              {
                'title': 'Breaking Bad',
                'image': 'assets/images/entertainment/12.jpg',
                'link': 'https://www.imdb.com/title/tt0903747/'
              },
              {
                'title': 'Game of Thrones',
                'image': 'assets/images/entertainment/13.jpg',
                'link': 'https://www.imdb.com/title/tt0944947/'
              },
              {
                'title': 'The Crown',
                'image': 'assets/images/entertainment/14.jpg',
                'link': 'https://www.imdb.com/title/tt4786824/'
              },
              {
                'title': 'Stranger Things',
                'image': 'assets/images/entertainment/15.jpg',
                'link': 'https://www.imdb.com/title/tt4574334/'
              },
              {
                'title': 'Sherlock',
                'image': 'assets/images/entertainment/16.jpg',
                'link': 'https://www.imdb.com/title/tt1475582/'
              },
              {
                'title': 'The Office',
                'image': 'assets/images/entertainment/17.jpg',
                'link': 'https://www.imdb.com/title/tt0386676/'
              },
              {
                'title': 'Narcos',
                'image': 'assets/images/entertainment/18.jpg',
                'link': 'https://www.imdb.com/title/tt2707408/'
              },
              {
                'title': 'The Witcher',
                'image': 'assets/images/entertainment/19.jpg',
                'link': 'https://www.imdb.com/title/tt5180504/'
              },
              {
                'title': 'Westworld',
                'image': 'assets/images/entertainment/20.jpg',
                'link': 'https://www.imdb.com/title/tt0475784/'
              },
            ]),
            const SizedBox(height: 20),
            buildSectionTitle(context, 'Novel Recommendations'),
            buildCarousel([
              {
                'title': 'To Kill a Mockingbird',
                'image': 'assets/images/entertainment/21.jpg',
                'link':
                    'https://www.google.com.eg/books/edition/_/PGR2AwAAQBAJ?hl=ar&gbpv=0'
              },
              {
                'title': '1984 by George Orwell',
                'image': 'assets/images/entertainment/22.jpg',
                'link':
                    'https://www.google.com.eg/books/edition/1984/kotPYEqx7kMC?hl=ar&gbpv=0'
              },
              {
                'title': 'Pride and Prejudice',
                'image': 'assets/images/entertainment/23.jpg',
                'link':
                    'https://www.google.com.eg/books/edition/Pride_and_Prejudice/EvqJCGeqKhsC?hl=ar&gbpv=0&bsq=Pride%20and%20Prejudice'
              },
              {
                'title': 'The Great Gatsby',
                'image': 'assets/images/entertainment/24.jpg',
                'link':
                    'https://www.google.com.eg/books/edition/The_Great_Gatsby/iWA-DwAAQBAJ?hl=ar&gbpv=0'
              },
              {
                'title': 'Moby-Dick',
                'image': 'assets/images/entertainment/25.jpg',
                'link':
                    'https://www.google.com.eg/books/edition/Moby_Dick/cyrMu-gkGQQC?hl=ar&gbpv=0'
              },
              {
                'title': 'War and Peace',
                'image': 'assets/images/entertainment/26.jpg',
                'link':
                    'https://www.google.com.eg/books/edition/War_and_Peace/jVMEAAAAYAAJ?hl=ar&gbpv=0'
              },
              {
                'title': 'The Catcher in the Rye',
                'image': 'assets/images/entertainment/27.jpg',
                'link':
                    'https://www.google.com.eg/books/edition/Salinger_s_The_Catcher_in_the_Rye/htdSEMt1ZKAC?hl=ar&gbpv=0'
              },
              {
                'title': 'Brave New World',
                'image': 'assets/images/entertainment/28.jpg',
                'link':
                    'https://www.google.com.eg/books/edition/Brave_New_World/ZiLvDwAAQBAJ?hl=ar&gbpv=0'
              },
              {
                'title': 'The Alchemist',
                'image': 'assets/images/entertainment/29.jpg',
                'link':
                    'https://www.google.com.eg/books/edition/The_Alchemist/6uHQg0YPcScC?hl=ar&gbpv=0'
              },
              {
                'title': 'The Hobbit',
                'image': 'assets/images/entertainment/30.jpg',
                'link':
                    'https://www.google.com.eg/books/edition/The_Hobbit/pD6arNyKyi8C?hl=ar'
              },
            ]),
            const SizedBox(height: 20),
            buildSectionTitle(context, 'Music Recommendations'),
            buildCarousel([
              {
                'title': 'Die With A Smile',
                'image': 'assets/images/entertainment/31.jpg',
                'link':
                    'https://open.spotify.com/track/2plbrEY59IikOBgBGLjaoe?si=24b4f138702d4a21'
              },
              {
                'title': 'Born To Die',
                'image': 'assets/images/entertainment/32.jpg',
                'link':
                    'https://open.spotify.com/track/4Ouhoi2lAhrLJKFzUqEzwl?si=7f7adb0a9a24409e'
              },
              {
                'title': 'Sweater Weather',
                'image': 'assets/images/entertainment/33.jpg',
                'link':
                    'https://open.spotify.com/track/2QjOHCTQ1Jl3zawyYOpxh6?si=396e0c1783b94247'
              },
              {
                'title': 'Bad Guy',
                'image': 'assets/images/entertainment/34.jpg',
                'link':
                    'https://open.spotify.com/track/2Fxmhks0bxGSBdJ92vM42m?si=04ff2d6bc43b40f5'
              },
              {
                'title': 'Swim',
                'image': 'assets/images/entertainment/35.jpg',
                'link':
                    'https://open.spotify.com/track/3M0lSi5WW79CXQamgSBIjx?si=38cb1daec0a04f06'
              },
              {
                'title': '505',
                'image': 'assets/images/entertainment/36.jpg',
                'link': 'https://open.spotify.com/track/0BxE4FqsDD1Ot4YuBXwAPp?si=7ba19cbb996f4dec'
              },
              {
                'title': 'Skyfall',
                'image': 'assets/images/entertainment/37.jpg',
                'link': 'https://open.spotify.com/track/6VObnIkLVruX4UVyxWhlqm?si=805d4a95e77f4492'
              },
              {
                'title': 'Let Her Go',
                'image': 'assets/images/entertainment/38.jpg',
                'link': 'https://open.spotify.com/track/5rEvuW4YhwobKwGL1HPrXA?si=0ee115bcab244cb1'
              },
              {
                'title': 'Blinding Lights',
                'image': 'assets/images/entertainment/39.jpg',
                'link':
                    'https://open.spotify.com/track/0VjIjW4GlUZAMYd2vXMi3b?si=c93eb39b623f4d72'
              },
              {
                'title': 'Sunflower',
                'image': 'assets/images/entertainment/40.jpg',
                'link':
                    'https://open.spotify.com/track/0RiRZpuVRbi7oqRdSMwhQY?si=9189fc10254d4edd'
              },
            ]),
            const SizedBox(height: 20),
            buildSectionTitle(context, 'Learn English YouTube Videos'),
            buildCarousel([
              {
                'title':
                    'Learn English in 30 Minutes - ALL the English Basics You Need',
                'image': 'assets/images/entertainment/y.jpg',
                'link':
                    'https://www.youtube.com/results?search_query=Learn+English+in+30+Minutes+-+ALL+the+English+Basics+You+Need'
              },
              {
                'title': 'Learn English Through Story - The Stranger',
                'image': 'assets/images/entertainment/y.jpg',
                'link':
                    'https://www.youtube.com/results?search_query=learn+english+through+story+the+stranger'
              },
              {
                'title': 'BBC Learning English - Tim’s Pronunciation Workshop',
                'image': 'assets/images/entertainment/y.jpg',
                'link':
                    'https://www.youtube.com/results?search_query=BBC+Learning+English+-+Tim%E2%80%99s+Pronunciation+Workshop'
              },
              {
                'title': 'Learn English with TV Series',
                'image': 'assets/images/entertainment/y.jpg',
                'link':
                    'https://www.youtube.com/results?search_query=learn+english+with+tv+series'
              },
              {
                'title': 'English Conversation Practice',
                'image': 'assets/images/entertainment/y.jpg',
                'link':
                    'https://www.youtube.com/results?search_query=English+Conversation+Practice'
              },
              {
                'title': 'English Listening Practice',
                'image': 'assets/images/entertainment/y.jpg',
                'link':
                    'https://www.youtube.com/results?search_query=English+Listening+Practice'
              },
              {
                'title': 'Speak English Like a Native',
                'image': 'assets/images/entertainment/y.jpg',
                'link':
                    'https://www.youtube.com/results?search_query=Speak+English+Like+a+Native'
              },
              {
                'title': 'English Pronunciation Tutorial',
                'image': 'assets/images/entertainment/y.jpg',
                'link':
                    'https://www.youtube.com/results?search_query=English+Pronunciation+Tutorial'
              },
              {
                'title': 'Learn English Vocabulary',
                'image': 'assets/images/entertainment/y.jpg',
                'link':
                    'https://www.youtube.com/results?search_query=Learn+English+Vocabulary'
              },
              {
                'title': 'English Grammar for Beginners',
                'image': 'assets/images/entertainment/y.jpg',
                'link':
                    'https://www.youtube.com/results?search_query=English+Grammar+for+Beginners'
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
        height: 500,
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
