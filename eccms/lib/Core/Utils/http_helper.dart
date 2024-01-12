import 'package:eccms/environment/environment.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'utility.dart';

class HttpHelper {
  static Uri uri(String url) {
    return Uri.parse(Environment.host + url);
  }

  static Future<http.Response> get(String url, SharedPreferences prefs) async {
    final response = await http.get(
      uri(url),
      headers: Utility.httpHeaders(prefs, {}),
    );
    if (response.statusCode == 401) {}
    return response;
  }

  static Future<http.Response> post(
      String url, SharedPreferences prefs, Object body) async {
    final response = await http.post(
      uri(url),
      headers: Utility.httpHeaders(prefs, {}),
      body: body,
    );
    if (response.statusCode == 401) {}
    return response;
  }

  static Future<http.Response> put(
      String url, SharedPreferences prefs, Object body) async {
    final response = await http.put(
      uri(url),
      headers: Utility.httpHeaders(prefs, {}),
      body: body,
    );
    if (response.statusCode == 401) {}
    return response;
  }

  static Future<http.Response> delete(
      String url, SharedPreferences prefs) async {
    final response = await http.delete(
      uri(url),
      headers: Utility.httpHeaders(prefs, {}),
    );
    if (response.statusCode == 401) {}
    return response;
  }
}
