import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/message_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  // void fetchMessages(UserModel user) {
  //   emit(ChatLoading());
  //   try {
  //     FirebaseServices.allMessages(user).listen((snapshot) {
  //       final messages = snapshot.docs.map((doc) {
  //         return MessageModel.fromJson(doc.data() as Map<String, dynamic>);
  //       }).toList();
  //       emit(ChatSuccess(messages: messages));
  //     });
  //   } catch (e) {
  //     if (!isClosed) {
  //       emit(ChatFailure(errorMessage: e.toString()));
  //     }
  //   }
  // }

  // Future<void> sendMessage(UserModel user, String msg) async {
  //   try {
  //     await FirebaseServices.sendMessage(user, msg);
  //     fetchMessages(user);
  //   } catch (e) {
  //     if (!isClosed) {
  //       emit(ChatFailure(errorMessage: e.toString()));
  //     }
  //   }
  // }
}
