import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tentwenty_assessment/core/extensions/theme_extension.dart';

import '../../domain/entities/movie.dart';


class MovieCard extends StatelessWidget {
  final Function(Movie)? onTap;
  final Movie movie;
  const MovieCard({super.key,required this.onTap,required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap?.call(movie);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        constraints: BoxConstraints(maxWidth: 335, maxHeight: 180),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider('${movie.posterPath}'))),
        child: Stack(
          children: [
            _shadeOverlay(),
            Positioned.fill(
                child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "${movie.title}",
                  style: context.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _shadeOverlay() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Colors.grey.withValues(alpha: 0.0),
                  Colors.grey.withValues(alpha: 0.0),
                  Colors.black,
                ],
                stops: [
                  0.0,
                  0.1,
                  1.0
                ])));
  }
}
