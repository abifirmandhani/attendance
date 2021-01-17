part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLogin extends UserState {
  @override
  List<Object> get props => [];
}

class UserError extends UserState {
  final String message;

  UserError(this.message);

  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final Guru guru;

  UserLoaded(this.guru);

  @override
  List<Object> get props => [];
}

class Userempty extends UserState {}
