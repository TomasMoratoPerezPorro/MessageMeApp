import 'package:MessageMeApp/model/group.dart';
import 'package:MessageMeApp/widgets/group_tile.dart';
import 'package:flutter/material.dart';

class GroupList extends StatelessWidget {
  const GroupList({
    @required this.groups,
  });

  final List<Group> groups;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        return GroupTile(groups[index]);
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 5,
          indent: 75,
          endIndent: 15,
        );
      },
    );
  }
}
