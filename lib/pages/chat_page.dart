import 'package:MessageMeApp/db.dart' as db;
import 'package:MessageMeApp/model/group.dart';
import 'package:MessageMeApp/model/message.dart';
import 'package:MessageMeApp/widgets/loading.dart';
import 'package:MessageMeApp/widgets/message_list.dart';
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
          return MessageList(messages: snapshot.data);
        },
      ),
    );
  }
}
