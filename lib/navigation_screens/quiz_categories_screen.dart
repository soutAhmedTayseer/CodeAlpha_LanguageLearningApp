import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_projects/components/background_widget.dart';
import 'package:flutter_projects/components/questions_and_answers.dart';
import 'package:flutter_projects/components/searchbar_widget.dart';
import 'package:flutter_projects/screens/quiz_screen.dart';

class QuizCategoriesScreenCategoriesScreen extends StatefulWidget {
  const QuizCategoriesScreenCategoriesScreen({super.key});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState
    extends State<QuizCategoriesScreenCategoriesScreen> {
  String searchQuery = ''; // To hold the search query

  @override
  Widget build(BuildContext context) {
    final filteredCategories = categories
        .where((category) =>
            category['title'].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizzes').tr(),
      ),
      body: Stack(
        children: [
          const BackgroundImage(
              imagePath:
                  'assets/images/backkground.jpeg'),
          Column(
            children: [
              // Search bar at the top
              CustomSearchBar(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0), // Add padding for left alignment
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        'Offline Quizzes',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Carousel, constrained to be smaller
              SizedBox(
                height: 220, // Limit the height of the carousel
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.85),
                  itemCount: filteredCategories.length,
                  itemBuilder: (BuildContext context, int index) {
                    final category = filteredCategories[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to QuizScreen when a card is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuizScreen(
                              categoryTitle: category['title'],
                              questions: category['questions'],
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Transform.scale(
                          scale: 0.9, // Slightly scale the selected card
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: AssetImage(category['image']),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  category['title'],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        offset: Offset(2, 2),
                                        blurRadius: 3.0,
                                        color: Colors.black54,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        'Online Quizzes',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}

