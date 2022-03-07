part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  
}

class LoadUserEvent extends UserEvent{
  final String id;
  LoadUserEvent(this.id);
  @override
  List<Object> get props => [id];
}

class SignOut extends UserEvent{
  @override

  List<Object> get props =>[];

}

class UpdateDataUser extends UserEvent{
  final String name;
  final String imageProfile;
  UpdateDataUser({this.name, this.imageProfile});
  @override
  List<Object> get props => [name,imageProfile];

}
 
class TopUp extends UserEvent{
  final int amount;
  TopUp(this.amount);
  @override
  List<Object> get props => [amount];
}

class Purchase extends UserEvent{
  final int amount;
  Purchase (this.amount);
  @override
  List<Object> get props => [amount];
}