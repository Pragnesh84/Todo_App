import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first/model/todo_model.dart';

class DatabaseMethods{
  Future addTaskDetails(Map<String, dynamic> taskInfoMap, String id)async{

    return await FirebaseFirestore.instance
        .collection("Task")
        .doc(id)
        .set(taskInfoMap);
  }

  Future<Stream<QuerySnapshot>> getTaskDetails()async{
    return FirebaseFirestore.instance.collection("Task").snapshots();
  }

  Future deleteTaskDetails(String id)async{
    return await FirebaseFirestore.instance.collection("Task").doc(id);
  }
}