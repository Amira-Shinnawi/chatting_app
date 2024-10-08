import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String? id;
  String? message;
  Timestamp? createdat;

  MessageModel({this.id, this.message, this.createdat});

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    createdat = json['createdat'] ?? null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['createdat'] = this.createdat;
    return data;
  }
}
