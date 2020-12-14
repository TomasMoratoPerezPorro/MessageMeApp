import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String id, text, user;
  DateTime dateTime;

  Message.fromFirestore(DocumentSnapshot doc)
      : id = doc.id,
        text = doc.data()['text'],
        dateTime = (doc.data()['dateTime'] as Timestamp).toDate();

  Map<String, dynamic> toFirestore() => {
        'text': this.text,
        'dateTime': this.dateTime,
      };

  Message(this.text) : dateTime = DateTime.now();
}

List<Message> toMessageList(QuerySnapshot query) {
  return query.docs.map((doc) => Message.fromFirestore(doc)).toList();
}
