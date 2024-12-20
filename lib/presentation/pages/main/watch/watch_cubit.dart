import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'watch_initial_params.dart';
import 'watch_state.dart';
import 'watch_navigator.dart';


class WatchCubit extends Cubit<WatchState> {
WatchNavigator navigator;
WatchCubit({required this.navigator}) : super(WatchState.initial());

BuildContext get context => navigator.context;

 onInit(WatchInitialParams initialParams){

  }

}
