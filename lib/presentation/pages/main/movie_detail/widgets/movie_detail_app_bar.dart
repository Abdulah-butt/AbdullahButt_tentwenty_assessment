import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tentwenty_assessment/core/extensions/theme_extension.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/movie_detail_cubit.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/movie_detail_state.dart';

import '../../../../widgets/custom_button.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailCubit cubit;

  const MovieDetailAppBar({super.key, required this.cubit});

  MovieDetailState get state =>cubit.state;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        "Watch",
        style: context.textTheme.bodyLarge?.copyWith(color: Colors.white),
      ),
      iconTheme: IconThemeData(color: Colors.white),
      expandedHeight: 450,
      collapsedHeight: 100,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider('${state.movie.posterPath}')),
          ),
          child: Stack(
            children: [
              _shadeOverlay(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "${state.movie.title}",
                      style: context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      "In theaters ${state.movie.releaseDate}",
                      style: context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      width: 240,
                      text: "Get Tickets",
                      onTap: cubit.getTicketAction,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      width: 240,
                      text: "Watch Trailer",
                      isSecondary: true,
                      onTap: cubit.watchTrailerAction,
                      icon: Icon(Icons.play_arrow),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _shadeOverlay() {
    return Container(
        decoration: BoxDecoration(
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
