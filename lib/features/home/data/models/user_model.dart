import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  Timestamp? createdat;
  String? name;
  String? email;
  String? pushToken;

  UserModel({this.uid, this.createdat, this.name, this.email, this.pushToken});

  UserModel.fromJson(json) {
    uid = json['uid'] ?? '';
    createdat = json['createdat'] ?? null;
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    pushToken = json['push_token'] ?? '';
  }
}
