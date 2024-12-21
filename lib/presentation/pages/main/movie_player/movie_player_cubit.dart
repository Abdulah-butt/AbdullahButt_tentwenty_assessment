import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'movie_player_initial_params.dart';
import 'movie_player_state.dart';
import 'movie_player_navigator.dart';


class MoviePlayerCubit extends Cubit<MoviePlayerState> {
MoviePlayerNavigator navigator;
MoviePlayerCubit({required this.navigator}) : super(MoviePlayerState.initial());

BuildContext get context => navigator.context;

 onInit(MoviePlayerInitialParams initialParams){

  }

}
