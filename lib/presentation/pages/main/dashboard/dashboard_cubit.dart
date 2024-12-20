import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'dashboard_initial_params.dart';
import 'dashboard_state.dart';
import 'dashboard_navigator.dart';


class DashboardCubit extends Cubit<DashboardState> {
DashboardNavigator navigator;
DashboardCubit({required this.navigator}) : super(DashboardState.initial());

BuildContext get context => navigator.context;

 onInit(DashboardInitialParams initialParams){

  }

}
