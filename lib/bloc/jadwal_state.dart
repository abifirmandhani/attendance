part of 'jadwal_bloc.dart';

abstract class JadwalState extends Equatable {
  const JadwalState();
  
  @override
  List<Object> get props => [];
}

class JadwalInitial extends JadwalState {}


class JadwalLoad extends JadwalState{}

class JadwalLoaded extends JadwalState{
  final List<Jadwal> listJadwal;

  JadwalLoaded(this.listJadwal);

  @override
  List<Object> get props => [];
}

class JadwalEmpty extends JadwalState {}
