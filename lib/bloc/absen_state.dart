part of 'absen_bloc.dart';

abstract class AbsenState extends Equatable {
  const AbsenState();

  @override
  List<Object> get props => [];
}

class AbsenInitial extends AbsenState {}

class AbsenLoading extends AbsenState {}

class AbsenError extends AbsenState{
  final String message;

  AbsenError(this.message);

  @override
  List<Object> get props => [];
}

class AbsenSuccess extends AbsenState{
  final String message;

  AbsenSuccess(this.message);

  @override
  List<Object> get props => [];
}
