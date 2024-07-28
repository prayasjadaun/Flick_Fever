import 'package:flick_fever/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tvShow.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                name: tvShow[index]['original_name'] ?? 'No Name',
                                description: tvShow[index]['overview'] ?? 'No Description',
                                bannerurl: tvShow[index]['backdrop_path'] != null
                                    ? 'https://image.tmdb.org/t/p/w500' +
                                    tvShow[index]['backdrop_path']
                                    : 'https://via.placeholder.com/500',
                                posterurl: tvShow[index]['poster_path'] != null
                                    ? 'https://image.tmdb.org/t/p/w500' +
                                    tvShow[index]['poster_path']
                                    : 'https://via.placeholder.com/500',
                                vote: tvShow[index]['vote_average']?.toString() ?? '0',
                                launch_on: tvShow[index]['release_date'] ?? 'Unknown',
                              )));
                    },
                    child: tvShow[index]['original_name'] != null
                        ? Container(
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
                                              'https://image.tmdb.org/t/p/w500' +
                                                  tvShow[index]
                                                      ['backdrop_path']),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: modifiedText(
                                    text: tvShow[index]['original_name'] ??
                                        'loading',
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  );
                }),
          )
        ],
      ),
    );
  }
}
