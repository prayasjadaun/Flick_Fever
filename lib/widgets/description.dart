import 'package:flick_fever/utils/text.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launch_on,});
  final String name, description, bannerurl,vote, posterurl, launch_on;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl, fit: BoxFit.cover,),
                  )),
                  Positioned(
                    bottom: 10,
                      child: modifiedText(text: ' ⭐ Average Rating - $vote', size: 18, color: Colors.white,)),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(10),
              child: modifiedText(text: name ?? 'Not Loaded',color: Colors.white,size: 24,),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: modifiedText(text: 'Releasing On - $launch_on', size: 14,color: Colors.white,),

            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                SizedBox(width: 5,),
                Flexible(
                  child: Container(
                    child: modifiedText(text: description,size: 16,color: Colors.white,),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
