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
      .snapshots()
      .map(toMessageList);
}
