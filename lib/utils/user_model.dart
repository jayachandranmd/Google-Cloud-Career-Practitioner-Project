import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String name;
  final String gender;
  final String role;
  final String accessControl;

  const User(
      {required this.email,
      required this.uid,
      required this.name,
      required this.gender,
      required this.role,
      required this.accessControl});

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        email: snapshot["email"],
        uid: snapshot["uid"],
        name: snapshot["name"],
        gender: snapshot['gender'],
        role: snapshot['role'],
        accessControl: snapshot['accessControl']);
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "uid": uid,
        "name": name,
        "gender": gender,
        "role": role,
        "accessControl": accessControl
      };
}
