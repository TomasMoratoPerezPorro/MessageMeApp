import 'package:MessageMeApp/model/group.dart';
import 'package:flutter/material.dart';

class GroupTile extends StatelessWidget {
  final Group group;
  const GroupTile(this.group);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 45,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.teal[400]),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(group.name),
          Text(
            "12/02/2021",
            style: TextStyle(color: Colors.grey[500], fontSize: 12),
          )
        ],
      ),
      subtitle: Text(group.id),
    );
  }
}
