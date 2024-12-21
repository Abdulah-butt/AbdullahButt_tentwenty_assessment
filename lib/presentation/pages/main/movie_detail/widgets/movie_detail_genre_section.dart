import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tentwenty_assessment/core/extensions/theme_extension.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/movie_detail_cubit.dart';

import '../../../../widgets/genre_chip.dart';
import '../movie_detail_state.dart';

class MovieDetailGenreSection extends StatelessWidget {
  final MovieDetailCubit cubit;
  const MovieDetailGenreSection({super.key,required this.cubit});
  MovieDetailState get state =>cubit.state;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Genres",style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),),
        Wrap(
          children: [
            for(var genre in state.movie.genres??[])
            GenreChip(text: "${genre.name}",color: getRandomColor(),),


          ],
        )
      ],
    );
  }

  // Generate a random color
  Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255, // Full opacity
      random.nextInt(256), // Random red value
      random.nextInt(256), // Random green value
      random.nextInt(256), // Random blue value
    );
  }
}
