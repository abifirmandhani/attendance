// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Guru _$GuruFromJson(Map<String, dynamic> json) {
  return Guru(
    json['Kode_Guru'] as int,
    json['Nip'] as String,
    json['Nama'] as String,
    json['Telp'] as String,
    json['Alamat'] as String,
    json['ID_Mapel'] as String,
  );
}

Map<String, dynamic> _$GuruToJson(Guru instance) => <String, dynamic>{
      'Kode_Guru': instance.Kode_Guru,
      'Nip': instance.Nip,
      'Nama': instance.Nama,
      'Telp': instance.Telp,
      'Alamat': instance.Alamat,
      'ID_Mapel': instance.ID_Mapel,
    };

Jadwal _$JadwalFromJson(Map<String, dynamic> json) {
  return Jadwal(
    json['ID_MapelKelas'] as int,
    json['Hari'] as String,
    json['Jam'] as String,
    json['NamaKelas'] as String,
    json['NamaMapel'] as String,
  );
}

Map<String, dynamic> _$JadwalToJson(Jadwal instance) => <String, dynamic>{
      'ID_MapelKelas': instance.ID_MapelKelas,
      'Hari': instance.Hari,
      'Jam': instance.Jam,
      'NamaKelas': instance.NamaKelas,
      'NamaMapel': instance.NamaMapel,
    };
