import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tentwenty_assessment/presentation/pages/main/bottom_nav/bottom_nav_bar.dart';
import 'package:tentwenty_assessment/presentation/pages/main/dashboard/dashboard_initial_params.dart';
import 'package:tentwenty_assessment/presentation/pages/main/dashboard/dashboard_page.dart';
import 'package:tentwenty_assessment/presentation/pages/main/media_library/media_library_initial_params.dart';
import 'package:tentwenty_assessment/presentation/pages/main/media_library/media_library_page.dart';
import 'package:tentwenty_assessment/presentation/pages/main/more/more_initial_params.dart';
import 'package:tentwenty_assessment/presentation/pages/main/more/more_page.dart';
import 'package:tentwenty_assessment/presentation/pages/main/watch/watch_initial_params.dart';
import 'package:tentwenty_assessment/presentation/pages/main/watch/watch_page.dart';
import 'package:url_strategy/url_strategy.dart';
import '../../presentation/pages/splash/splash_initial_params.dart';
import '../../presentation/pages/splash/splash_page.dart';
import '../../service_locator/service_locator.dart';
import '../navigation/app_navigator.dart';

final GlobalKey<NavigatorState> _bottomNavShellNavigator =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class AppRouter {
  static initialize() {
    setPathUrlStrategy();
    GoRouter.optionURLReflectsImperativeAPIs = true;
  }

  static final router = GoRouter(
    navigatorKey: AppNavigator.navigatorKey,
    initialLocation: DashboardPage.path,
    routes: [
      GoRoute(
        path: SplashPage.path,
        builder: (context, state) {
          return SplashPage(
            cubit: getIt(),
            initialParams: const SplashInitialParams(),
          );
        },
      ),

      /// BOTTOM NAV BAR AND THEIR INNER SCREENS
      ShellRoute(
        navigatorKey: _bottomNavShellNavigator,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return BottomNavBar(
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: DashboardPage.path,
            builder: (context, state) {
              return DashboardPage(
                cubit: getIt(),
                initialParams: const DashboardInitialParams(),
              );
            },
          ),
          GoRoute(
            path: DashboardPage.path,
            builder: (context, state) {
              return DashboardPage(
                cubit: getIt(),
                initialParams: const DashboardInitialParams(),
              );
            },
          ),
          GoRoute(
            path: WatchPage.path,
            builder: (context, state) {
              return WatchPage(
                cubit: getIt(),
                initialParams: const WatchInitialParams(),
              );
            },
          ),
          GoRoute(
            path: MediaLibraryPage.path,
            builder: (context, state) {
              return MediaLibraryPage(
                cubit: getIt(),
                initialParams: const MediaLibraryInitialParams(),
              );
            },
          ),
          GoRoute(
            path: MorePage.path,
            builder: (context, state) {
              return MorePage(
                cubit: getIt(),
                initialParams: const MoreInitialParams(),
              );
            },
          ),

        ]
      ),
    ],
  );
}
