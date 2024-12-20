import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'media_library_initial_params.dart';
import 'media_library_state.dart';
import 'media_library_navigator.dart';


class MediaLibraryCubit extends Cubit<MediaLibraryState> {
MediaLibraryNavigator navigator;
MediaLibraryCubit({required this.navigator}) : super(MediaLibraryState.initial());

BuildContext get context => navigator.context;

 onInit(MediaLibraryInitialParams initialParams){

  }

}
