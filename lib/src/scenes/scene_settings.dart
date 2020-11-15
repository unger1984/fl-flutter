import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mobile/src/bottom_tabbar.dart';
import 'package:mobile/src/top_appbar.dart';

class SceneSettings extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(),
      bottomNavigationBar: BottomTabbar(),
    );
  }
}
