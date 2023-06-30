import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/content/data/entities/login_data.dart';

abstract  class SharedPreferencesService{
  static const _weatherKey = "weather-data";
  static const _loginDataKey = "login-data";

  static Future setLoginData(LoginData data) async{
    var pref = await SharedPreferences.getInstance();
    await pref.setString(_loginDataKey, jsonEncode(data.toJson()) );
  }

  static Future<LoginData?> getLoginData() async{
    var pref = await SharedPreferences.getInstance();
    var jsonString = pref.getString(_loginDataKey);
    if(jsonString != null && jsonString.isNotEmpty){
      return Future.value(LoginData.fromJson(jsonDecode(jsonString)));
    }
    
    return null;
  }
}