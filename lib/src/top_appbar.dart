import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'providers/TabbarProvider.dart';

class TopAppBar extends HookWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  TopAppBar({Key key})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabbarState = useProvider<TabbarProvider>(tabbarProvider);

    getTitle() {
      switch (tabbarState.active) {
        case ActiveTab.projects:
          return 'Проекты';
        case ActiveTab.filter:
          return 'Фильтры';
        case ActiveTab.settings:
          return 'Настройки';
      }
    }

    return AppBar(
      title: Text(
        getTitle(),
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      backgroundColor: Colors.green,
    );
  }
}
