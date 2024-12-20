import 'package:flutter/material.dart';
import '../../../../core/navigation/app_navigator.dart';
import 'media_library_page.dart';
import 'media_library_initial_params.dart';



class MediaLibraryNavigator {
MediaLibraryNavigator(this.navigator);

@override
late BuildContext context;

@override
late AppNavigator navigator;

}

mixin MediaLibraryRoute {
openMediaLibrary(MediaLibraryInitialParams initialParams) {

 navigator.push(context, MediaLibraryPage.path, initialParams);

}

AppNavigator get navigator;

BuildContext get context;
}
