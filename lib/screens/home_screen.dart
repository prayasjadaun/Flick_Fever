import 'package:flick_fever/utils/text.dart';
import 'package:flick_fever/widgets/top_rated_movies.dart';
import 'package:flick_fever/widgets/trending_movies.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../widgets/tv_show.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tvShow = [];
  final apiKey = 'd31e410abe13cf8501026c967eeac0a3';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkMzFlNDEwYWJlMTNjZjg1MDEwMjZjOTY3ZWVhYzBhMyIsIm5iZiI6MTcyMjE2MTAzOC43NzAwNDQsInN1YiI6IjY2YTUyNjkxZjljYWU1ZmZmZDMwMDAxYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Zwk24AEdxgSmMoUXKoMIY2FU2750jGl8wCP-O8Fv_1w';

  @override
  initState() {
    super.initState();
    loadMovies();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(
          showErrorLogs: true,
          showLogs: true,
        ));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingResult['results'] ?? [];
      topRatedMovies = topRatedResult['results'] ?? [];
      tvShow = tvResult['results'] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const modifiedText(
          text: 'F L I C K F E V E R',
          color: Colors.white,
          size: 20,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TvShow(tvShow:tvShow ),
          TrendingMovies(trending: trendingMovies),
          TopRatedMovies(topRated: topRatedMovies),

        ],
      ),
    );
  }
}
