import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile/src/bottom_tabbar.dart';
import 'package:mobile/src/providers/TabbarProvider.dart';
import 'package:mobile/src/top_appbar.dart';

class SceneMain extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final tabbarState = useProvider<TabbarProvider>(tabbarProvider);
    PageController _pageController =
        useMemoized(() => PageController(initialPage: 0));

    int getActiveScene() {
      switch (tabbarState.active) {
        case ActiveTab.projects:
          return 0;
        case ActiveTab.filter:
          return 1;
        case ActiveTab.settings:
          return 2;
      }
    }

    return Scaffold(
      appBar: TopAppBar(),
      body: PageView(
        controller: _pageController,
        physics: new NeverScrollableScrollPhysics(),
        children: [
          Center(
            child: Text('Test 1'),
          ),
          Center(
            child: Text('Test 2'),
          ),
          Center(
            child: Text('Test 3'),
          ),
        ],
      ),
      bottomNavigationBar: BottomTabbar(pageController: _pageController),
    );
  }
}
