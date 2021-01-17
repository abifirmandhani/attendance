part of 'services.dart';

class UserPreference{
  final _loginKey = 'loginStatus';
  final _idUserKey = 'idUser';
  static final UserPreference _instance = UserPreference._privateCons();

  factory UserPreference(){
    return _instance;
  }

  UserPreference._privateCons();

  SharedPreferences _pref;

  init() async{
    _pref = await SharedPreferences.getInstance();
  }

  get loginStatus{
    return _pref.getBool(_loginKey) ?? false;
  }

  set loginStatus(bool status){
    _pref.setBool(_loginKey, status);
  }

  get idUser{
    return _pref.getInt(_idUserKey);
  }

  set idUser(int idUser){
    _pref.setInt(_idUserKey, idUser);
  }

}