import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_system_bloc/Api/api.dart';
import 'package:flutter_login_system_bloc/Api/profile_jsonToDart.dart';
import 'package:flutter_login_system_bloc/Api/storage.dart';
import 'package:flutter_login_system_bloc/bloc/login/login_event.dart';
import 'package:flutter_login_system_bloc/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(InitState initState) : super(InitState()) {
    on<TokenCheckEvent>(tokenCheck);
    on<LoginButtonPressedEvent>(loginButtonPressed);
    on<LogoutButtonPressedEvent>(logoutButtonPressed);
  }

//logic for tokenchecker
  void tokenCheck(
      TokenCheckEvent tokenCheckEvent, Emitter<LoginState> emitter) async {
    emitter.call(InitState());
    bool userLoggedIn = await checkLogin();
    try {
      if (userLoggedIn == false) {
        emitter.call(LoginFailedState(message: "Not Logged In"));
        Duration(seconds: 1);
        // await Future.delayed(Duration(seconds: 1));
        emitter.call(LoggedoutState());
      } else if (userLoggedIn == true) {
        User? data = await LoginAPI.getprofile();
        if (data!.status != "success") {
          emitter.call(LoginFailedState(message: "${data.message}, Error"));
          Duration(seconds: 1);
          // await Future.delayed(Duration(seconds: 1));
          emitter.call(LoggedoutState());
        } else if (data.status == "success") {
          print("Logging In");
          Duration(seconds: 1);
          // await Future.delayed(Duration(seconds: 1));
          emitter.call(LoggedInState(userProfile: data));
        }
      }
    } catch (e) {
      emitter.call(LoginFailedState(message: "Error"));
      Duration(seconds: 1);
      // await Future.delayed(Duration(seconds: 1));
      emitter.call(LoggedoutState());
    }
  }

// logic for loginbuttonpressed
  void loginButtonPressed(LoginButtonPressedEvent loginButtonPressedEvent,
      Emitter<LoginState> emitter) async {
    emitter.call(InitState());
    try {
      print(loginButtonPressedEvent.email);
      print(loginButtonPressedEvent.password);
      var response = await LoginAPI.login(
          loginButtonPressedEvent.email, loginButtonPressedEvent.password);
      if (response["status"] == "success") {
        //saves token
        saveLogin(
            '${response["access_token"]}', '${response["refresh_token"]}');
        User? data = await LoginAPI.getprofile();
        emitter.call(LoggedInState(userProfile: data));
      } else {
        emitter.call(LoginFailedState(message: "${response["message"]}"));
        Duration(seconds: 1);
        // await Future.delayed(Duration(seconds: 1));
        emitter.call(LoggedoutState());
      }
    } catch (_) {
      emitter.call(LoginFailedState(message: "Error while logged in"));
    }
  }

//logic for logoutbuttonpressed
  void logoutButtonPressed(LogoutButtonPressedEvent logoutButtonPressedEvent,
      Emitter<LoginState> emitter) async {
    emitter.call(InitState());
    try {
      var logoutRes = await LoginAPI.logout();
      if (logoutRes["status"] == "success") {
        //this function delete all the generated token stored in flutter secure storage.
        deleteLogin();
        print("Logging out");
        Duration(seconds: 1);
        // await Future.delayed(Duration(seconds: 1));
        emitter.call(LoggedoutState());
      } else {
        emitter.call(LoginFailedState(message: "${logoutRes["message"]}"));
      }
    } catch (_) {
      emitter.call(LoginFailedState(message: "Logout not Successful."));
    }
  }

  // @override
  // Stream<LoginState> mapEventToState(LoginEvent event) async* {
  //   if (event is TokenCheckEvent) {
  //     yield* tokenCheck(event);
  //   }
  //   if (event is LoginButtonPressedEvent) {
  //     yield* loginButtonPressed(event);
  //   }
  //   if (event is LogoutButtonPressedEvent) {
  //     yield* logoutButtonPressed(event);
  //   }
  // }

// Stream<LoginState> tokenCheck(TokenCheckEvent tokenCheckEvent) async* {
  //   yield InitState();
  //   bool userLoggedIn = await checkLogin();
  //   try {
  //     if (userLoggedIn == false) {
  //       yield LoginFailedState(message: "Not Logged In");
  //       await Future.delayed(Duration(seconds: 1));
  //       yield LoggedoutState();
  //     } else if (userLoggedIn == true) {
  //       User? data = await LoginAPI.getprofile();
  //       if (data!.status != "success") {
  //         yield LoginFailedState(message: "${data.message}, Error");
  //         await Future.delayed(Duration(seconds: 1));
  //         yield LoggedoutState();
  //       } else if (data.status == "success") {
  //         // yield LoginFailedState(message: "Logged In");
  //         await Future.delayed(Duration(seconds: 1));
  //         yield LoggedInState(userProfile: data);
  //       }
  //     }
  //   } catch (e) {
  //     yield LoginFailedState(message: "Something went wrong");
  //     await Future.delayed(Duration(seconds: 1));
  //     print("try ma error ayera ya bata form ma pugo");
  //     yield LoggedoutState();
  //   }
  // }

// Stream<LoginState> loginButtonPressed(
  //     LoginButtonPressedEvent loginButtonPressedEvent) async* {
  //   yield InitState();
  //   try {
  //     print(loginButtonPressedEvent.email);
  //     print(loginButtonPressedEvent.password);
  //     var response = await LoginAPI.login(
  //         loginButtonPressedEvent.email, loginButtonPressedEvent.password);
  //     if (response["status"] == "success") {
  //       //saves token
  //       saveLogin(
  //           '${response["access_token"]}', '${response["refresh_token"]}');
  //       User? data = await LoginAPI.getprofile();
  //       yield LoggedInState(userProfile: data);
  //     } else {
  //       yield LoginFailedState(message: "${response["message"]}");
  //       // await Future.delayed(Duration(seconds: 1));
  //       yield LoggedoutState();
  //     }
  //   } catch (_) {
  //     yield LoginFailedState(message: "Error while logged in");
  //   }
  // }

  // Stream<LoginState> logoutButtonPressed(
  //     LogoutButtonPressedEvent logoutButtonPressedEvent) async* {
  //   yield InitState();
  //   try {
  //     var logoutRes = await LoginAPI.logout();
  //     if (logoutRes["status"] == "success") {
  //       deleteLogin();
  //       yield LoggedoutState();
  //     } else {
  //       yield LoginFailedState(message: "${logoutRes["message"]}");
  //     }
  //   } catch (_) {
  //     yield LoginFailedState(message: "Logout not successfull");
  //   }
  // }
}
