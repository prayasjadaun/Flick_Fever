import 'package:flick_fever/utils/text.dart';
import 'package:flutter/material.dart';

import 'description.dart';

class TvShow extends StatelessWidget {
  const TvShow({
    super.key,
    required this.tvShow,
  });
  final List tvShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modifiedText(
              text: 'Popular Tv Shows', color: Colors.white, size: 26),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tvShow.length,
                itemBuilder: (context, index) {
                  final show = tvShow[index];
                  final name = show['original_name'] ?? 'No Name';
                  final backdropPath = show['backdrop_path'];
                  final posterPath = show['poster_path'];
                  final overview = show['overview'] ?? 'No Description';
                  final voteAverage = show['vote_average']?.toString() ?? '0';
                  final releaseDate = show['release_date'] ?? 'Unknown';

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Description(
                            name: name,
                            description: overview,
                            bannerurl: backdropPath != null
                                ? 'https://image.tmdb.org/t/p/w500$backdropPath'
                                : 'https://archive.org/download/placeholder-image/placeholder-image.jpg',
                            posterurl: posterPath != null
                                ? 'https://image.tmdb.org/t/p/w500$posterPath'
                                : 'https://archive.org/download/placeholder-image/placeholder-image.jpg',
                            vote: voteAverage,
                            launch_on: releaseDate,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            width: 250,
                            height: 140,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(
                                  backdropPath != null
                                      ? 'https://image.tmdb.org/t/p/w500$backdropPath'
                                      : 'https://archive.org/download/placeholder-image/placeholder-image.jpg',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            child: modifiedText(
                              text: name,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
