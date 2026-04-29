import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tasky_app/data/result_firebase.dart';
import 'package:tasky_app/model/app_user.dart';

abstract class AuthFireBase {
  static CollectionReference<AppUser> getCollection() => FirebaseFirestore
      .instance
      .collection("users")
      .withConverter<AppUser>(
        fromFirestore: (json, options) => AppUser.fromJson(json.data()!),
        toFirestore: (value, options) => value.tojson(),
      );

  static Future<FireBaseResult<AppUser>> addUser(AppUser user) async {
    try {
      await getCollection().doc(user.id).set(user);
      return Succes(user);
    } catch (e) {
      return Erorr(e.toString());
    }
  }

  static Future<FireBaseResult<bool>> login({
    required String email,
    required String password,
    required AppUser user,
  }) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return Succes(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalied - credential") {
        return Erorr("invalied credential from fire base try again later");
      }
      return Erorr("FirebaseAuthException");
    } catch (e) {
      return Erorr("unknowen  erorr");
    }
  }

  static Future<FireBaseResult<AppUser>> regstier(AppUser user) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email!,
            password: user.password!,
          );
      user.id = credential.user!.uid;
      final result = await addUser(user);
      switch (result) {
        case Succes<AppUser>():
          return Succes<AppUser>(user);
        case Erorr<AppUser>():
          return Erorr("Erorrn at adding user to data base");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "waek-password") {
        return Erorr("weak  passwored");
      } else if (e.code == "email-already-in-use") {
        return Erorr("email already in use");
      } else
        (null);
      return Erorr("try again");
    } catch (e) {
      return Erorr("un exbicted erorr");
    }
  }
}
