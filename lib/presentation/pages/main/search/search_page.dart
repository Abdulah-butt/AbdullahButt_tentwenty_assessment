import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tentwenty_assessment/core/extensions/theme_extension.dart';
import 'package:tentwenty_assessment/core/utils/constants.dart';
import 'package:tentwenty_assessment/domain/entities/movie.dart';
import 'package:tentwenty_assessment/presentation/pages/main/search/search_state.dart';
import '../../../widgets/custom_search_textfield.dart';
import 'search_cubit.dart';
import 'search_initial_params.dart';
import 'widgets/movie_search_result_tile.dart';

class SearchPage extends StatefulWidget {
  final SearchCubit cubit;
  final SearchInitialParams initialParams;

  static const path = '/SearchPage';

  const SearchPage({
    Key? key,
    required this.cubit,
    required this.initialParams,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  SearchCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
    cubit.onInit(widget.initialParams);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.colorTheme.surfaceDim,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            flexibleSpace: Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CustomSearchTextField(
                    controller: cubit.txtSearch,
                    onSubmit:cubit.onSearch,
                    onChange: (val){

                    },
                    hint: "TV shows, movies and more",
                  )),
            ),
          ),
          body: BlocBuilder<SearchCubit, SearchState>(
            bloc: cubit,
            builder: (context, state) {
              return (!state.loading) && state.movies.isEmpty
                  ? Center(
                      child: Text("No result found"),
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kScreenHorizontalPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Top results",
                                style: context.textTheme.bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Skeletonizer(
                            enabled: state.loading,
                            child: ListView.builder(
                              itemCount:  state.loading?10:state.movies.length,
                              itemBuilder: (context, index) {
                                Movie movie=state.loading?Movie.shimmer():state.movies[index];
                                return MovieSearchResultTile(
                                  movie: movie,
                                  onTap: cubit.movieDetail,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
            },
          )),
    );
  }
}
