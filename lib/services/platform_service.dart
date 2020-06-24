import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class PlatformService {
  PlatformService();

  dynamic launch({@required String url}) async {
    if (await launcher.canLaunch(url)) {
      return await launcher.launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<bool> store({@required String token}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', token);
  }

  Future<String> retrieveToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
}
