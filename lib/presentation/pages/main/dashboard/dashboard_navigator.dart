import 'package:flutter/material.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/movie_detail_navigator.dart';
import 'package:tentwenty_assessment/presentation/pages/main/search/search_navigator.dart';
import '../../../../core/navigation/app_navigator.dart';
import 'dashboard_page.dart';
import 'dashboard_initial_params.dart';



class DashboardNavigator with SearchRoute,MovieDetailRoute{
DashboardNavigator(this.navigator);

@override
late BuildContext context;

@override
late AppNavigator navigator;

}

mixin DashboardRoute {
openDashboard(DashboardInitialParams initialParams) {

 navigator.push(context, DashboardPage.path, initialParams);

}

AppNavigator get navigator;

BuildContext get context;
}
