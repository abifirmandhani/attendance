part of 'absen_bloc.dart';

abstract class AbsenEvent extends Equatable {
  const AbsenEvent();

  @override
  List<Object> get props => [];
}

class AddAbsen extends AbsenEvent{
  final Jadwal jadwal;
  final File foto;
  final double distance;

  AddAbsen(this.jadwal, this.foto, this.distance);

  @override
  List<Object> get props => [];
}
