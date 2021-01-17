import 'dart:async';
import 'dart:io';

import 'package:absensi/models/models.dart';
import 'package:absensi/services/services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'jadwal_event.dart';
part 'jadwal_state.dart';

class JadwalBloc extends Bloc<JadwalEvent, JadwalState> {
  JadwalBloc() : super(JadwalInitial());

  @override
  Stream<JadwalState> mapEventToState(
    JadwalEvent event,
  ) async* {
    if (event is FetchJadwal) {
      try {
        yield JadwalLoad();
        var response =
            await JadwalService().getJadwal();
        List listJadwal = response['data'];
        List<Jadwal> baru  = [];
        listJadwal.forEach((e) { 
          baru.add(Jadwal.fromJson(e));
        });
        yield JadwalLoaded(baru);
      } catch (message) {
        print(message);
        yield JadwalEmpty();
      }
    }
  }
}
