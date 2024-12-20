import 'package:flutter/material.dart';
import '../../../../core/navigation/app_navigator.dart';
import 'watch_page.dart';
import 'watch_initial_params.dart';



class WatchNavigator {
WatchNavigator(this.navigator);

@override
late BuildContext context;

@override
late AppNavigator navigator;

}

mixin WatchRoute {
openWatch(WatchInitialParams initialParams) {

 navigator.push(context, WatchPage.path, initialParams);

}

AppNavigator get navigator;

BuildContext get context;
}
