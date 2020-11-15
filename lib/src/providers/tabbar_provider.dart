import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum ActiveTab { projects, filter, settings }

class TabbarProvider extends ChangeNotifier {
  ActiveTab active = ActiveTab.projects;

  setActive(ActiveTab active) {
    this.active = active;
    notifyListeners();
  }
}

final tabbarProvider =
    ChangeNotifierProvider<TabbarProvider>((_) => TabbarProvider());
