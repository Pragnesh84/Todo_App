import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel{
  String? docID;
  final String taskName;
  final String description;
  final String subTask;

  TodoModel({
    this.docID,
    required this.taskName,
    required this.description,
    required this.subTask,
  });

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      'docID': docID,
      'taskName': taskName,
      'description': description,
      'subTask': subTask,
    };
  }
  factory TodoModel.fromMap(Map<String, dynamic> map){
    return TodoModel(
      docID: map['docID'] != null ? map['docID'] as String : null,
      taskName: map['taskName'] as String,
      description: map['description'] as String,
      subTask: map['subTask'] as String,

    );
  }

  factory TodoModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc){
    return TodoModel(
      docID: doc.id,
        taskName: doc['taskName'],
        description: doc['description'],
        subTask: doc['subTask'],
    );
  }

}