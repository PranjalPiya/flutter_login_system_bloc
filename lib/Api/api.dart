// import 'dart:html';

import 'package:flutter_login_system_bloc/Api/profile_jsonToDart.dart';
// import 'package:flutter_login_system_bloc/Api/storage.dart';
import 'package:flutter_login_system_bloc/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//auth Repository
class LoginAPI {
  // for login request
  static Future login(String email, String password) async {
    var url = Uri.parse("https://api.ikreate.com.np/intern/login");
    var reqHeader = {
      'primary-auth': 'api.ikreate.com.np',
    };
    var reqBody = {
      "email-address": "$email",
      "password": "$password",
    };
    try {
      http.Response response = await http.post(
        url,
        headers: reqHeader,
        body: reqBody,
      );
      if (response.statusCode == 200) {
        var decodeRes = json.decode(response.body);
        print(decodeRes);

        print('Response status: ${response.statusCode}');
        print('access-token = ${decodeRes['access_token']}');
        print('refresh-token = ${decodeRes['refresh_token']}');
        return decodeRes;
      }
    } catch (e) {}
  }

  //for logout request
  static Future logout() async {
    final String? accessToken = await secureStorage?.read(key: 'access-token');
    final String? refreshToken =
        await secureStorage?.read(key: 'refresh-token');
    print(' Logout TOKEN');
    print(accessToken);
    print(refreshToken);

    final String logoutURL = "https://api.ikreate.com.np/intern/logout";
    var decodeRes;

    try {
      final response = await http.post(
        Uri.parse(logoutURL),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'primary-auth': 'api.ikreate.com.np',
          'access-token': '$accessToken',
          'refresh-token': '$refreshToken'
        },
      );
      if (response.statusCode == 200) {
        decodeRes = json.decode(response.body);
        print('Response Status: ${response.statusCode}');

        return decodeRes;
      }
    } catch (e) {}
  }

// -------------------------------------------------------------------------
  //for profile
  static Future<User?> getprofile() async {
    final String? accessToken = await secureStorage?.read(key: 'access-token');
    final String? refreshToken =
        await secureStorage?.read(key: 'refresh-token');
    print('Profile Token');
    print(accessToken);
    print(refreshToken);

    final String profileURL = "https://api.ikreate.com.np/intern/profile";
    var decodeRes;

    try {
      final response = await http.get(
        Uri.parse(profileURL),
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'primary-auth': 'api.ikreate.com.np',
          'access-token': '$accessToken',
          'refresh-token': '$refreshToken'
        },
      );
      if (response.statusCode == 200) {
        decodeRes = User.fromJson(json.decode(response.body));

        print('Response Status: ${response.statusCode}');
        print("response: ${decodeRes.runtimeType}");
        return decodeRes;
      }
      return null;
    } catch (e) {}
  }
}
