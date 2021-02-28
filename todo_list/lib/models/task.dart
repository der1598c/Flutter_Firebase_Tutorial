
import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String title;
  final String taskId;

  Task(
    this.title,
    [this.taskId]
  );

  factory Task.fromSnapshot(DocumentSnapshot snapshot) {
    final map = snapshot.data();
    return Task(
      map["title"],
      snapshot.id
    );
  }
}