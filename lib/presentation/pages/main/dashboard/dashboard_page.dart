import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: const Center(child: Text("Dashboard"),),
    );
  }
}
