import 'package:MessageMeApp/db.dart' as db;
import 'package:MessageMeApp/model/group.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
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
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Group> groups = snapshot.data;
          return ListView.builder(
            itemCount: groups.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(groups[index].name));
            },
          );
        },
      ),
    );
  }
}
