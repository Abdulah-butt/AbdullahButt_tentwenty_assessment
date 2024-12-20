import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'watch_cubit.dart';
import 'watch_initial_params.dart';
import 'watch_state.dart';

class WatchPage extends StatefulWidget {
  final WatchCubit cubit;
  final WatchInitialParams initialParams;

  static const path = '/WatchPage';

  const WatchPage({
    Key? key,
    required this.cubit,
    required this.initialParams,
  }) : super(key: key);

  @override
  State<WatchPage> createState() => _WatchState();
}

class _WatchState extends State<WatchPage> {
  WatchCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
    cubit.onInit(widget.initialParams);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("Watch"),),
    );
  }
}
