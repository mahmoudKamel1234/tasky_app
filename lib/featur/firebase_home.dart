import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasky_app/data/result_firebase.dart';
import 'package:tasky_app/model/task_model_app.dart';

abstract class HomeFireBase {
  CollectionReference<TaskModel> getCollection() {
    final id = FirebaseAuth.instance.currentUser?.uid;
    return FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("tasks")
        .withConverter(
          fromFirestore: (snapshot, options) =>
              TaskModel.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.tojson(),
        );
  }

  Future<FireBaseResult<TaskModel>> addTask(TaskModel task) async {
    try {
      await getCollection().doc().set(task);
      return Succes<TaskModel>(task);
    } on SocketException {
      return Erorr<TaskModel>("no enternet connection");
    } catch (e) {
      return Erorr("please try again latter ");
    }
  }
}
