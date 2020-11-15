import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'src/scenes/scene_main.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (BuildContext context) => SceneMain(),
        },
      ),
    ),
  );
}
