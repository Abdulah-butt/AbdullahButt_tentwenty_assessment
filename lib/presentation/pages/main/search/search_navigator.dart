import 'package:flutter/material.dart';
import 'package:tentwenty_assessment/presentation/pages/main/movie_detail/movie_detail_navigator.dart';
import '../../../../core/navigation/app_navigator.dart';
import 'search_page.dart';
import 'search_initial_params.dart';



class SearchNavigator with MovieDetailRoute {
SearchNavigator(this.navigator);

@override
late BuildContext context;

@override
late AppNavigator navigator;

}

mixin SearchRoute {
openSearch(SearchInitialParams initialParams) {

 navigator.push(context, SearchPage.path, initialParams);

}

AppNavigator get navigator;

BuildContext get context;
}
