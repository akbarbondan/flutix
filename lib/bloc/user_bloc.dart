import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bwa_fllutix/models/models.dart';
import 'package:bwa_fllutix/services/services.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  // TODO: implement initialState
  UserState get initialState => UserInitial();
  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUserEvent) {
      // ModelUser user = await UserServices.getUser(event.id);
      // yield UserLoadState(user);
    } else if (event is SignOut) {
      AuthServices.signOut();
      yield UserInitial();
    } else if (event is UpdateDataUser) {
      ModelUser updatedUser = (state as UserLoadState)
          .user
          .copyWith(name: event.name, profilePictureImage: event.imageProfile);
      await UserServices.updateUser(updatedUser);
      yield UserLoadState(updatedUser);
    } else if (event is TopUp) {
      if (state is UserLoadState) {
        try {
          ModelUser updateUser = (state as UserLoadState).user.copyWith(
              balance: (state as UserLoadState).user.balance + event.amount);
          await UserServices.updateUser(updateUser);
          yield UserLoadState(updateUser);
        } catch (e) {
          print(e);
        }
      }
    } else if (event is Purchase) {
      if (state is UserLoadState) {
        try {
          ModelUser updateUser = (state as UserLoadState).user.copyWith(
              balance: (state as UserLoadState).user.balance - event.amount);
          await UserServices.updateUser(updateUser);
          yield UserLoadState(updateUser);
        } catch (e) {
          print(e);
        }
      }
    }
  }
}
