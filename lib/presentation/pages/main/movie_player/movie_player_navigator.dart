import 'package:flutter/material.dart';
import '../../../../core/navigation/app_navigator.dart';
import 'movie_player_page.dart';
import 'movie_player_initial_params.dart';



class MoviePlayerNavigator {
MoviePlayerNavigator(this.navigator);

@override
late BuildContext context;

@override
late AppNavigator navigator;

}

mixin MoviePlayerRoute {
openMoviePlayer(MoviePlayerInitialParams initialParams) {
 navigator.push(context, "${MoviePlayerPage.path}?url=${initialParams.url}", initialParams);

}

AppNavigator get navigator;

BuildContext get context;
}
