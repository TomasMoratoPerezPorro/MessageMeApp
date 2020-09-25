import 'package:cloud_firestore/cloud_firestore.dart';

class Group {
  String id;
  String name;

  Group.fromFirestore(DocumentSnapshot doc)
      : id = doc.id,
        name = doc.data()['name'];
}

List<Group> toGroupList(QuerySnapshot query) {
  return query.docs.map((doc) => Group.fromFirestore(doc)).toList();
}
