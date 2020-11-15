import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/src/models/Project.dart';

class ProjectItem extends StatelessWidget {
  final Project project;

  const ProjectItem({Key key, this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(project.title,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                project.text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat('dd.MM.yyyy kk:mm').format(project.date),
                    style: TextStyle(fontSize: 12)),
                Text(project.price, style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
