import 'dart:async';

import 'package:absensi/models/models.dart';
import 'package:absensi/services/services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoginUser) {
      try {
        yield UserLogin();
        var response =
            await UserServices().login(event.username, event.password);
          print(response['Data']);
        if (response['Data'].isEmpty) {
          print("empty");
          yield Userempty();
        } else {
          Guru data = Guru.fromJson(response['Data']);
          UserPreference().idUser = data.Kode_Guru;
          UserPreference().loginStatus = true;
          yield UserLoaded(data);
        }
      } catch (message) {
        yield UserError(message.toString());
      }
    }
  }
}
