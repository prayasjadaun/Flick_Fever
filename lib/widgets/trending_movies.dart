import 'package:flick_fever/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'description.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({
    super.key,
    required this.trending,
  });
  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modifiedText(
              text: 'Trending Movies', color: Colors.white, size: 26),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                    name: trending[index]['title'],
                                    description: trending[index]['overview'],
                                    bannerurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['backdrop_path'],
                                    posterurl:
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['poster_path'],
                                    vote: trending[index]['vote_average'].toString(),
                                    launch_on:trending[index]['release_date'],
                                  )));
                    },
                    child:
                        trending[index]['title']!=null?
                    Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['poster_path']))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Expanded(
                              child: modifiedText(
                                text: trending[index]['title'] ?? 'loading',
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ): Container(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
