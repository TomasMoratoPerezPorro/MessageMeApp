import 'package:MessageMeApp/db.dart' as db;
import 'package:MessageMeApp/model/group.dart';
import 'package:MessageMeApp/widgets/group_list.dart';
import 'package:MessageMeApp/widgets/loading.dart';
import 'package:MessageMeApp/widgets/red_error.dart';
import 'package:flutter/material.dart';

class GroupListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MessageMeApp"),
      ),
      body: StreamBuilder(
        stream: db.getGroups(),
        builder: (context, AsyncSnapshot<List<Group>> snapshot) {
          if (snapshot.hasError) {
            return RedError(snapshot.error);
          }
          if (!snapshot.hasData) {
            return Loading();
          }

          return GroupList(groups: snapshot.data);
        },
      ),
    );
  }
}
