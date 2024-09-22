import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiForMovies extends StatefulWidget {
  const ApiForMovies({super.key});

  @override
  _ApiForMoviesState createState() => _ApiForMoviesState();
}

class _ApiForMoviesState extends State<ApiForMovies> {
  List<dynamic> movies = [];

  @override
  void initState() {
    super.initState();
    fetchTrendingMovies();
  }

  Future<void> fetchTrendingMovies() async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/trending/movie/day?api_key=74e10a6d118e02393b8a51d3283d2582'));

    if (response.statusCode == 200) {
      setState(() {
        movies = json.decode(response.body)['results'];
      });
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Entertainment')),
      body: movies.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle(context, 'Movie Recommendations'),
            buildMovieCarousel(movies),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildMovieCarousel(List<dynamic> movies) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 200,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index, realIndex) {
        final movie = movies[index];
        return Column(
          children: [
            Expanded(
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(movie['title'], style: const TextStyle(fontSize: 16)),
          ],
        );
      },
    );
  }
}
