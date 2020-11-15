import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers/tabbar_provider.dart';

class BottomTabbar extends HookWidget {
  final PageController pageController;

  BottomTabbar({@required this.pageController});

  @override
  Widget build(BuildContext context) {
    final tabbarState = useProvider<TabbarProvider>(tabbarProvider);

    handleTap(int index) {
      switch (index) {
        case 1:
          tabbarState.setActive(ActiveTab.filter);
          break;
        case 2:
          tabbarState.setActive(ActiveTab.settings);
          break;
        case 0:
        default:
          tabbarState.setActive(ActiveTab.projects);
          break;
      }
      this.pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }

    return BottomNavigationBar(
      backgroundColor: Colors.green,
      currentIndex: 0,
      onTap: handleTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/projects.svg',
            color: tabbarState.active == ActiveTab.projects
                ? Colors.white
                : Colors.black,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/filter.svg',
            color: tabbarState.active == ActiveTab.filter
                ? Colors.white
                : Colors.black,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svg/settings.svg',
            color: tabbarState.active == ActiveTab.settings
                ? Colors.white
                : Colors.black,
          ),
          label: '',
        ),
      ],
    );
  }
}
