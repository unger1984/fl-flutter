import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile/src/scenes/scene_filter.dart';
import 'package:mobile/src/scenes/scene_projects.dart';
import 'package:mobile/src/scenes/scene_settings.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        initialRoute: '/projects',
        routes: {
          '/projects': (BuildContext context) => SceneProjects(),
          '/filter': (BuildContext context) => SceneFilter(),
          '/settings': (BuildContext context) => SceneSettings(),
        },
      ),
    ),
  );
}
