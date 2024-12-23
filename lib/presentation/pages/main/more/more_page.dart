import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'more_cubit.dart';
import 'more_initial_params.dart';
import 'more_state.dart';

class MorePage extends StatefulWidget {
  final MoreCubit cubit;
  final MoreInitialParams initialParams;

  static const path = '/MorePage';

  const MorePage({
    Key? key,
    required this.cubit,
    required this.initialParams,
  }) : super(key: key);

  @override
  State<MorePage> createState() => _MoreState();
}

class _MoreState extends State<MorePage> {
  MoreCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    cubit.navigator.context = context;
    cubit.onInit(widget.initialParams);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text("More"),),
    );
  }
}
