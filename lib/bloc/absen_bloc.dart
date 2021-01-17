import 'dart:async';
import 'dart:io';

import 'package:absensi/models/models.dart';
import 'package:absensi/services/services.dart';
import 'package:absensi/shared/shareds.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'absen_event.dart';
part 'absen_state.dart';

class AbsenBloc extends Bloc<AbsenEvent, AbsenState> {
  AbsenBloc() : super(AbsenInitial());

  @override
  Stream<AbsenState> mapEventToState(
    AbsenEvent event,
  ) async* {
    if(event is AddAbsen){
      try{
          yield AbsenLoading();
        if(event.foto == null){
          yield AbsenError("Foto tidak boleh kosong");
        }
        else if(event.distance > minDistance){
          yield AbsenError("Jarak anda lebih dari $minDistance meter");
        }
        else{
          var response = await  JadwalService().absen(event.jadwal, event.foto);
          yield AbsenSuccess(response['message']);
        }
      }catch(message){
        yield AbsenError(message);
      }
    }
  }
}
