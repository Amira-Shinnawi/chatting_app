import 'package:bloc/bloc.dart';
import 'package:chatting_app/core/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/utils/app_services.dart';
import '../../data/models/user_model.dart';

part 'all_user_state.dart';

class AllUserCubit extends Cubit<AllUserState> {
  AllUserCubit() : super(AllUserInitial());
  Future<void> fetchUsers() async {
    emit(AllUserLoading());
    try {
      String currentUserId = FirebaseAuth.instance.currentUser?.uid ?? '';
      final QuerySnapshot snapshot =
          await FirebaseServices.fireStore.collection(kUsers).get();
      List<UserModel> users = snapshot.docs
          .map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>))
          .where((user) => user.uid != currentUserId)
          .toList();
      emit(FetchAllUser(users: users));
    } catch (e) {
      emit(AllUserFailure(errorMessage: e.toString()));
    }
  }
}
