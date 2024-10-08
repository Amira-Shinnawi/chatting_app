part of 'all_user_cubit.dart';

sealed class AllUserState extends Equatable {
  const AllUserState();

  @override
  List<Object> get props => [];
}

final class AllUserInitial extends AllUserState {}

final class FetchAllUser extends AllUserState {
 final List<UserModel> users;
 const FetchAllUser({required this.users});
}
final class AllUserLoading extends AllUserState {}

final class AllUserFailure extends AllUserState {
   final String errorMessage;

 const AllUserFailure({required this.errorMessage});

}
