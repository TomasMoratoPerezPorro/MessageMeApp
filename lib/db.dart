import 'package:MessageMeApp/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'model/group.dart';

Stream<List<Group>> getGroups() {
  return FirebaseFirestore.instance
      .collection('groups')
      .snapshots()
      .map(toGroupList);
}

Stream<List<Message>> getGroupsMessages(String groupID) {
  return FirebaseFirestore.instance
      .collection('groups/$groupID/messages')
      .orderBy('dateTime', descending: true)
      .snapshots()
      .map(toMessageList);
}

Future<void> sendMessage(String groupId, Message msg) async {
  await FirebaseFirestore.instance
      .collection('groups/$groupId/messages')
      .add(msg.toFirestore());
}
