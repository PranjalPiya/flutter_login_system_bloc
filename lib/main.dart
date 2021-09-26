import 'package:flutter/material.dart';
import 'package:flutter_login_system_bloc/screen/screensplash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

FlutterSecureStorage? secureStorage;
void main() {
  secureStorage = FlutterSecureStorage();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: ScreenSplash(),
    );
  }
}
