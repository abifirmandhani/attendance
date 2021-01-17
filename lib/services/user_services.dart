part of 'services.dart';

class UserServices {
  Future<dynamic> login(String username, String password) async {
    var url = baseUrl + "login";

    var map = new Map<String, dynamic>();
    map['Kode_Guru'] = username;
    map['Password'] = password;

    var response = await http
        .post(url, body: map)
        .timeout(Duration(seconds: 10), onTimeout: () {
      throw new Exception("Conenction time out");
    });

    
    var json = convert.jsonDecode(response.body);
    return json;
  }
}
