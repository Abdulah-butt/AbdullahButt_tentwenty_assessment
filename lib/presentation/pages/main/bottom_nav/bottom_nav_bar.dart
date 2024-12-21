import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tentwenty_assessment/core/extensions/theme_extension.dart';
import 'package:tentwenty_assessment/core/utils/assets.dart';
import 'package:tentwenty_assessment/presentation/pages/main/dashboard/dashboard_page.dart';
import 'package:tentwenty_assessment/presentation/pages/main/media_library/media_library_page.dart';
import 'package:tentwenty_assessment/presentation/pages/main/more/more_page.dart';
import 'package:tentwenty_assessment/presentation/pages/main/watch/watch_page.dart';

class BottomNavBar extends StatefulWidget {
  final Widget child;

  const BottomNavBar({super.key, required this.child});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(27),
          topRight: Radius.circular(27),
        ),
        child: BottomNavigationBar(
          currentIndex: _calculateSelectedIndex(context),
          onTap: _onMenuTapped,
          items: [
            _customBottomNavIcon(
              label: "Dashboard",
              assetPath: Assets.dashboard,
              isSelected: _selectedIndex == 0,
            ),
            _customBottomNavIcon(
              label: "Watch",
              assetPath: Assets.watch,
              isSelected: _selectedIndex == 1,
            ),
            _customBottomNavIcon(
              label: "Media Library",
              assetPath: Assets.mediaLibrary,
              isSelected: _selectedIndex == 2,
            ),
            _customBottomNavIcon(
              label: "More",
              assetPath: Assets.more,
              isSelected: _selectedIndex == 3,
            ),
          ],
        ),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith(DashboardPage.path)) {
      return 0;
    }
    if (location.startsWith(WatchPage.path)) {
      return 1;
    }
    if (location.startsWith(MediaLibraryPage.path)) {
      return 2;
    }
    if (location.startsWith(MorePage.path)) {
      return 3;
    }
    return 0;
  }

  void _onMenuTapped(int index) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(DashboardPage.path);
      case 1:
        GoRouter.of(context).go(WatchPage.path);
      case 2:
        GoRouter.of(context).go(MediaLibraryPage.path);
      case 3:
        GoRouter.of(context).go(MorePage.path);
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _customBottomNavIcon(
      {required String label,
      required String assetPath,
      Widget? child,
      bool isSelected = false}) {
    return BottomNavigationBarItem(
      label: label,
      icon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: child ??
            SvgPicture.asset(
              assetPath,
              color: isSelected
                  ? context.colorTheme.onSecondary
                  : context.colorTheme.tertiary,
              // height: 30,
            ),
      ),
    );
  }
}
