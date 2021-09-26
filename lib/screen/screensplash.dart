import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_system_bloc/bloc/login/login_bloc.dart';
import 'package:flutter_login_system_bloc/bloc/login/login_event.dart';
import 'package:flutter_login_system_bloc/bloc/login/login_state.dart';
import 'package:flutter_login_system_bloc/screen/homepage.dart';
import 'package:flutter_login_system_bloc/screen/login_textform.dart';
import 'package:flutter_login_system_bloc/screen/screenLoad.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  _ScreenSplashState createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      gradientBackground: LinearGradient(
          colors: [Colors.blue.shade300, Colors.blue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter),
      image: Image.asset('images/islington_logo.png'),
      // image: Image.asset('images/todo_logo.png'),
      photoSize: 100,
      loaderColor: Colors.black,
      loadingText: Text(
        'Powered by ikreate',
        style: TextStyle(
          fontSize: 20,
          fontStyle: FontStyle.italic,
        ),
      ),
      navigateAfterSeconds: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(InitState())..add(TokenCheckEvent()),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoggedInState) {
              return HomePage(activeUser: state.userProfile);
            } else if (state is LoggedoutState) {
              return Login();
            }
            return LoadingBar();
          },
        ),
      ),
    );
  }
}
