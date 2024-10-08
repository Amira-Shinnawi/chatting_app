import 'dart:developer';

import 'package:chatting_app/features/home/data/models/message_model.dart';
import 'package:chatting_app/features/home/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseServices {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  static User get user => auth.currentUser!;

  static String getChatMessage(String id) => user.uid.hashCode <= id.hashCode
      ? '${user.uid}_$id'
      : '${id}_${user.uid}';

  static Stream<QuerySnapshot<Map<String, dynamic>>> allMessages(
      UserModel user) {
    return fireStore
        .collection('chats/${getChatMessage(user.uid!)}/messages/')
        .snapshots();
  }

  static Future<void> sendMessage(
      UserModel user, String msg, Timestamp createdat) async {
    final time = DateTime.now().millisecondsSinceEpoch.toString();
    final MessageModel messageModel = MessageModel(
      message: msg,
      id: user.uid!,
      createdat: createdat,
    );
    final ref =
        fireStore.collection('chats/${getChatMessage(user.uid!)}/messages/');
    await ref.doc(time).set(messageModel.toJson());
  }

  static Future<bool> logOut() async {
    return (await fireStore.collection('users').doc(user.uid).get()).exists;
  }

  static UserModel userModel = UserModel();
  static Future<void> getNotification() async {
    await messaging.requestPermission();
    final token = await messaging.getToken();
    log('token $token');
    
  }
}
