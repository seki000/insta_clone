import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insta_clone/datamodel/user.dart';

class DatabaseManager {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> searchUserInDb( firebaseUser) async {
    final query = await _db
        .collection("users")
        .where("userId", isEqualTo: firebaseUser.uid)
        .get();
    if (query.docs.length > 0) {
      return true;
    }
    return false;
  }

  Future<void> insertUser(User user) async{
    await _db.collection("users").doc(user.UserId).set(user.toMap());
  }

  Future<User> getUserInfoFromDbById(String uid) async{
    final query = await _db.collection("users").where("userId", isEqualTo: uid).get();
    return User.fromMap(query.docs[0].data());
  }
  }


