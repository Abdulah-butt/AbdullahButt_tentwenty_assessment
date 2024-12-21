import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tentwenty_assessment/core/utils/constants.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/movie_detail_state.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/widgets/movie_detail_app_bar.dart';
import 'movie_detail_cubit.dart';
import 'movie_detail_initial_params.dart';
import 'widgets/movie_detail_genre_section.dart';
import 'widgets/movie_detail_overview_section.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieDetailCubit cubit;
  final MovieDetailInitialParams initialParams;

  static const path = '/MovieDetailPage';

  const MovieDetailPage({
    Key? key,
    required this.cubit,
    required this.initialParams,
  }) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetailPage> {
  MovieDetailCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
    cubit.onInit(widget.initialParams);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailCubit,MovieDetailState>(
        bloc: cubit,
        builder: (context,state) {
          return Skeletonizer(
            enabled: state.loading,
            child: CustomScrollView(
              slivers: [
                MovieDetailAppBar(
                  cubit: cubit,
                ),
                SliverToBoxAdapter(
                  child:Padding(
                    padding: const EdgeInsets.all(kScreenHorizontalPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MovieDetailGenreSection(
                          cubit: cubit,
                        ),
                        Divider(thickness: 1,),
                        MovieDetailOverviewSection(
                          cubit: cubit,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
