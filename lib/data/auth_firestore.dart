import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tasky_app/model/app_user.dart';

abstract class AuthAppFirebase {
  CollectionReference<AppUser> get _getCollection => FirebaseFirestore.instance
      .collection("users")
      .withConverter<AppUser>(
        fromFirestore: (json, options) => AppUser.fromJson(json.data()!),
        toFirestore: (value, options) => value.tojson(),
      );

 Future<AppUser?> addUser(AppUser user) async {
    try {
      
      await _getCollection.doc(user.id).set(user);
      return user;
    } catch (e) {
      print("Error adding user: $e");
      return null;
    }
  }


 Future<bool> deleteUser(String id) async {
    try {
      await _getCollection.doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<AppUser?> updateUser(AppUser user) async {
    try {
      await _getCollection.doc(user.id).update(user.tojson());
      return user;
    } catch (e) {
      return null;
    }
  }

}
