import 'package:MessageMeApp/db.dart';
import 'package:MessageMeApp/model/group.dart';
import 'package:MessageMeApp/db.dart' as db;
import 'package:MessageMeApp/model/message.dart';
import 'package:MessageMeApp/widgets/loading.dart';
import 'package:MessageMeApp/widgets/red_error.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Group group = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(group.name),
      ),
      body: StreamBuilder(
        stream: db.getGroupsMessages(group.id),
        builder: (context, AsyncSnapshot<List<Message>> snapshot) {
          if (snapshot.hasError) {
            return RedError(snapshot.error);
          }
          if (!snapshot.hasData) {
            return Loading();
          }
          List<Message> messages = snapshot.data;
          return ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(messages[index].text),
                subtitle: Text(messages[index].dateTime.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
