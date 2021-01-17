part of 'models.dart';

@JsonSerializable(explicitToJson: true)
class Guru {
  int Kode_Guru;
  String Nip, Nama, Telp, Alamat, ID_Mapel;

  Guru(this.Kode_Guru, this.Nip, this.Nama, this.Telp, this.Alamat,
      this.ID_Mapel);

  factory Guru.fromJson(Map<String, dynamic> json) => _$GuruFromJson(json);
  Map<String, dynamic> toJson() => _$GuruToJson(this);
}
