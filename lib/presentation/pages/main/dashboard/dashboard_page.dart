import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tentwenty_assessment/core/extensions/theme_extension.dart';
import 'package:tentwenty_assessment/core/utils/constants.dart';
import 'package:tentwenty_assessment/domain/entities/movie.dart';
import '../../../widgets/movie_card.dart';
import 'dashboard_cubit.dart';
import 'dashboard_initial_params.dart';
import 'dashboard_state.dart';

class DashboardPage extends StatefulWidget {
  final DashboardCubit cubit;
  final DashboardInitialParams initialParams;

  static const path = '/DashboardPage';

  const DashboardPage({
    Key? key,
    required this.cubit,
    required this.initialParams,
  }) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardState();
}

class _DashboardState extends State<DashboardPage> {
  DashboardCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
    cubit.onInit(widget.initialParams);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorTheme.surfaceDim,
      appBar: AppBar(title: Text("Watch"), actions: [
        IconButton(onPressed: cubit.searchAction, icon: Icon(Icons.search)),
      ]),
      body: BlocBuilder<DashboardCubit, DashboardState>(
        bloc: cubit,
        builder: (context, state) {
          return Skeletonizer(
            enabled: state.loading,
            child: ListView.builder(
                padding: EdgeInsets.all(kScreenHorizontalPadding),
                itemCount: state.loading ? 10 : state.movies.length,
                itemBuilder: (context, index) {
                  Movie movie =
                      state.loading ? Movie.shimmer() : state.movies[index];
                  return MovieCard(
                    onTap: cubit.movieDetailAction,
                    movie: movie,
                  );
                }),
          );
        },
      ),
    );
  }
}
