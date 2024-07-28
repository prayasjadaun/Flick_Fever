import 'package:flick_fever/utils/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'description.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({
    super.key,
    required this.topRated,
  });
  final List topRated;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const modifiedText(text: 'Top Rated Movies', color: Colors.white, size: 26),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRated.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                name: topRated[index]['title'],
                                description: topRated[index]['overview'],
                                bannerurl:
                                'https://image.tmdb.org/t/p/w500' +
                                    topRated[index]['backdrop_path'],
                                posterurl:
                                'https://image.tmdb.org/t/p/w500' +
                                    topRated[index]['poster_path'],
                                vote: topRated[index]['vote_average'].toString(),
                                launch_on:topRated[index]['release_date'],
                              )));
                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500'+
                                            topRated[index]['poster_path']))),
                          ),
                          SizedBox(height: 10,),

                          Container(
                            child: modifiedText(
                              text: topRated[index]['title'] ?? 'loading', size: 15, color: Colors.white,

                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
