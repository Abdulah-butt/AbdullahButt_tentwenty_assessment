import 'package:flutter/material.dart';
import 'package:tentwenty_assessment/core/extensions/theme_extension.dart';
import 'package:tentwenty_assessment/domain/entities/movie.dart';

import '../../../../widgets/custom_cached_image.dart';

class MovieSearchResultTile extends StatelessWidget {
  final Movie movie;
  final Function(Movie)? onTap;
  const MovieSearchResultTile({super.key,required this.movie,this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap?.call(movie);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            CustomCachedImage(
              imgUrl:"${movie.posterPath}",
              width: 130,
              radius: 10,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${movie.title}",
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "release date: ${movie.releaseDate}",
                    style: context.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz,
                  color: context.colorTheme.primary,
                )),
          ],
        ),
      ),
    );
  }
}
