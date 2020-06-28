import 'package:shared_preferences/shared_preferences.dart';
import 'package:meta/meta.dart';

class PlatformService {
  Future<bool> store({@required String token}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', token);
  }

  Future<String> retrieveToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
