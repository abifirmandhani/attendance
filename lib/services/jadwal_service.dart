part of 'services.dart';

class JadwalService {
  Future<dynamic> absen(Jadwal jadwal, File foto) async {
    var idGuru = UserPreference().idUser.toString();
    var url = baseUrl + "add";
    var uri = Uri.parse(url);

    var request = http.MultipartRequest("POST", uri);
    request.fields['idGuru'] = idGuru;
    request.fields['idMapelKelas'] = jadwal.ID_MapelKelas.toString();
    if (foto != null) {
      var fileSize = await foto.length();
      if (fileSize > 5242880) {
        throw new Exception("File size more than 5Mb");
      }
      request.files.add(await http.MultipartFile.fromPath('FotoGuru', foto.path,
          contentType: MediaType('image', 'jpeg')));
    } else {
      throw new Exception("Foto is required");
    }

    var response =
        await request.send().timeout(Duration(seconds: 10), onTimeout: () {
      throw new Exception("Connection time out");
    });

    var response2 = await http.Response.fromStream(response);
    if (response.statusCode == 404) {
      throw new Exception("Jadwal ada jadwal");
    }

    return convert.jsonDecode(response2.body);
  }

  Future getJadwal() async {
    var url = baseUrl + "jadwal/" + UserPreference().idUser.toString();

    var response =
        await http.get(url).timeout(Duration(seconds: 10), onTimeout: () {
      throw new Exception("Connection timeout");
    });
    if (response.statusCode == 404) {
      throw new Exception("Jadwal ada jadwal");
    }

    return convert.jsonDecode(response.body);
  }
}
