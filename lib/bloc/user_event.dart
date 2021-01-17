part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable{
  const UserEvent();

  @override
  List<Object> get props => [];
}


class LoginUser extends UserEvent{
  final String username, password;

  LoginUser(this.username, this.password);

  @override
  List<Object> get props => [];
}
