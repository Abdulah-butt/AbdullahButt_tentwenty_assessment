import 'package:flutter/material.dart';

import 'movie_genre_card.dart';

class MovieGenreBuilder extends StatelessWidget {
  const MovieGenreBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return   GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
          ),
          itemCount: 20,
          itemBuilder: (_, index) => MovieGenreCard(),
        );
  }
}
