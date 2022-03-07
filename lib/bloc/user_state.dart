part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  
}

class UserInitial extends UserState{
  List<Object> get props => [];
}

class UserLoadState extends UserState{
 final ModelUser user;
 UserLoadState(this.user);
  List<Object> get props => [user];

}