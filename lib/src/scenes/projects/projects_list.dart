import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile/src/providers/projects_provider.dart';

import 'project_item.dart';

class ProjectsList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final projects = useProvider(projectsProvider);

    useEffect(() {
      Future.microtask(() => projects.getList());
      return;
    }, []);

    handleRefresh() async {
      await projects.getList();
    }

    return RefreshIndicator(
      onRefresh: handleRefresh,
      child: ListView.builder(
        itemCount: projects.list.length,
        itemBuilder: (BuildContext context, int index) {
          return ProjectItem(project: projects.list[index]);
        },
      ),
    );
  }
}
