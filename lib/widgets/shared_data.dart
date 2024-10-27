import 'package:shared_preferences/shared_preferences.dart';

class SharedData {
  static const statusKey = 'status';

  static String status = '';

  static Future setAdmin(String status) async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(statusKey, status);
  }

  static Future <String> getAdmin() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(statusKey) ?? '';
  }

  static Future initStatus() async {
    status = await getAdmin();
  }

  static Future exitStatus() async{
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(statusKey);
  }

}