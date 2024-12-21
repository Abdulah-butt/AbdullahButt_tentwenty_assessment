import 'package:flutter/material.dart';
import 'package:tentwenty_assessment/core/extensions/theme_extension.dart';

import '../movie_detail_cubit.dart';
import '../movie_detail_state.dart';

class MovieDetailOverviewSection extends StatelessWidget {
  final MovieDetailCubit cubit;
  const MovieDetailOverviewSection({super.key,required this.cubit});

  MovieDetailState get state =>cubit.state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Overview",
          style: context.textTheme.bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        Text(
         "${state.movie.overview}",
          style: context.textTheme.bodySmall,
        ),
      ],
    );
  }
}
