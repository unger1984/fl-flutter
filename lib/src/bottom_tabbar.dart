import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers/TabbarProvider.dart';

class BottomTabbar extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final tabbarState = useProvider<TabbarProvider>(tabbarProvider);

    handlePressProjetcs() {
      if (tabbarState.active != ActiveTab.projects) {
        tabbarState.setActive(ActiveTab.projects);
        Navigator.pushNamedAndRemoveUntil(
            context, "/projects", (route) => false);
      }
    }

    handlePressFilter() {
      if (tabbarState.active != ActiveTab.filter) {
        tabbarState.setActive(ActiveTab.filter);
        Navigator.pushNamedAndRemoveUntil(context, "/filter", (route) => false);
      }
    }

    handlePressSetting() {
      if (tabbarState.active != ActiveTab.settings) {
        tabbarState.setActive(ActiveTab.settings);
        Navigator.pushNamedAndRemoveUntil(
            context, "/settings", (route) => false);
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: IconButton(
              onPressed: handlePressProjetcs,
              icon: SvgPicture.asset(
                'assets/svg/projects.svg',
                color: tabbarState.active == ActiveTab.projects
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
          Container(
            child: IconButton(
              onPressed: handlePressFilter,
              icon: SvgPicture.asset(
                'assets/svg/filter.svg',
                color: tabbarState.active == ActiveTab.filter
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
          Container(
            child: IconButton(
              onPressed: handlePressSetting,
              icon: SvgPicture.asset(
                'assets/svg/settings.svg',
                color: tabbarState.active == ActiveTab.settings
                    ? Colors.white
                    : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
