import 'package:shared_preferences/shared_preferences.dart';

class VSharedPrefs {
  late final SharedPreferences prefs;

  static final VSharedPrefs _instance = VSharedPrefs._internal();

  factory VSharedPrefs() => _instance;

  VSharedPrefs._internal();

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  String? get username {
    return prefs.getString("username");
  }

  set username(String? value) {
    value != null ? prefs.setString("username", value) : "";
  }

  String? get rememberedUsername {
    return prefs.getString("remembered_username");
  }

  set rememberedUsername(String? value) {
    value != null ? prefs.setString("remembered_username", value) : "";
  }

  String? get rememberedPassword {
    return prefs.getString("remembered_password");
  }

  set rememberedPassword(String? value) {
    value != null ? prefs.setString("remembered_password", value) : "";
  }

}