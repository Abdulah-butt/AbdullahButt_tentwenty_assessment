import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'media_library_cubit.dart';
import 'media_library_initial_params.dart';
import 'media_library_state.dart';

class MediaLibraryPage extends StatefulWidget {
  final MediaLibraryCubit cubit;
  final MediaLibraryInitialParams initialParams;

  static const path = '/MediaLibraryPage';

  const MediaLibraryPage({
    Key? key,
    required this.cubit,
    required this.initialParams,
  }) : super(key: key);

  @override
  State<MediaLibraryPage> createState() => _MediaLibraryState();
}

class _MediaLibraryState extends State<MediaLibraryPage> {
  MediaLibraryCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
    cubit.onInit(widget.initialParams);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("Media Library"),),
    );
  }
}
