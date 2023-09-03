

import 'package:shared_preferences/shared_preferences.dart';


const String PREF_KEY_ISLOGGEDIN="isLoggedIn";

class AppPreference{

  SharedPreferences _sharedPreferences;

  AppPreference(this._sharedPreferences);


Future<bool> isLoggedIn() async{
  return _sharedPreferences.getBool(PREF_KEY_ISLOGGEDIN)??false;
}
Future<String> getLanguage() async{
  return _sharedPreferences.getString("lang")??"en";
}
}