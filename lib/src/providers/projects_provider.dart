import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile/src/api/api.dart';
import 'package:mobile/src/models/Project.dart';

class ProjectsProvider extends ChangeNotifier {
  List<Project> list = [];
  bool isProgress = false;

  getList() async {
    isProgress = true;
    notifyListeners();
    final res = await api.getProjects();
    if (res.success) {
      list.clear();
      res.data["rows"].forEach((item) => list.add(Project.fromJson(item)));
    }
    isProgress = false;
    notifyListeners();
  }
}

final projectsProvider = ChangeNotifierProvider((_) => ProjectsProvider());
