import 'package:flutter_login_system_bloc/main.dart';

checkLogin() async {
  String? token = await secureStorage?.read(key: 'access-token');
  if (token != null)
    return true;
  else
    return false;
}

//store token
saveLogin(accessToken, refreshToken) async {
  await secureStorage?.write(key: 'access-token', value: '$accessToken');
  await secureStorage?.write(key: 'refresh-token', value: '$refreshToken');
}

//this function deletes all the token that is stored.
deleteLogin() async {
  await secureStorage?.deleteAll();
}
