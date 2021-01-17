part of 'models.dart';

@JsonSerializable(explicitToJson: true)
class Jadwal {
  int ID_MapelKelas;
  String Hari, Jam, NamaKelas, NamaMapel;

  Jadwal(this.ID_MapelKelas, this.Hari, this.Jam, this.NamaKelas, this.NamaMapel);

  factory Jadwal.fromJson(Map<String, dynamic> json) => _$JadwalFromJson(json);
  Map<String, dynamic> toJson() => _$JadwalToJson(this);
}