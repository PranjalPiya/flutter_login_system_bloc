import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_system_bloc/Api/api.dart';
import 'package:flutter_login_system_bloc/Api/profile_jsonToDart.dart';
import 'package:flutter_login_system_bloc/Api/storage.dart';
import 'package:flutter_login_system_bloc/bloc/login/login_event.dart';
import 'package:flutter_login_system_bloc/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(InitState initState) : super(InitState());

  // {
  //   on<TokenCheckEvent>((event, emit) => emit(tokenCheck(event)));
  //   on<LoginButtonPressedEvent>(
  //       (event, emit) => emit(loginButtonPressed(event)));
  //   on<LogoutButtonPressedEvent>(
  //       (event, emit) => emit(logoutButtonPressed(event)));
  // }

  // @override
  // Stream<LoginState> onEvent(LoginEvent event) async* {
  //   if (event is TokenCheckEvent) {
  //     yield* tokenCheck(event);
  //   }
  //   if (event is LoginButtonPressedEvent) {
  //     yield* loginButtonPressed(event);
  //   }
  //   if (event is LogoutButtonPressedEvent) {
  //     yield* logoutButtonPressed(event);
  //   }
  //   super.onEvent(event);
  // }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is TokenCheckEvent) {
      yield* tokenCheck(event);
    }
    if (event is LoginButtonPressedEvent) {
      yield* loginButtonPressed(event);
    }
    if (event is LogoutButtonPressedEvent) {
      yield* logoutButtonPressed(event);
    }
  }

//logic for tokenchecker
  Stream<LoginState> tokenCheck(TokenCheckEvent tokenCheckEvent) async* {
    yield InitState();
    bool userLoggedIn = await checkLogin();
    try {
      if (userLoggedIn == false) {
        yield LoginFailedState(message: "Not Logged In");
        await Future.delayed(Duration(seconds: 1));

        yield LoggedoutState();
      } else if (userLoggedIn == true) {
        User? data = await LoginAPI.getprofile();
        if (data!.status != "success") {
          yield LoginFailedState(message: "${data.message}, Error");
          await Future.delayed(Duration(seconds: 1));

          yield LoggedoutState();
        } else if (data.status == "success") {
          // yield LoginFailedState(message: "Logged In");
          await Future.delayed(Duration(seconds: 1));
          yield LoggedInState(userProfile: data);
        }
      }
    } catch (e) {
      yield LoginFailedState(message: "Something went wrong");
      await Future.delayed(Duration(seconds: 1));
      print("try ma error ayera ya bata form ma pugo");
      yield LoggedoutState();
    }
  }

// logic for loginbuttonpressed
  Stream<LoginState> loginButtonPressed(
      LoginButtonPressedEvent loginButtonPressedEvent) async* {
    yield InitState();
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
        yield LoggedInState(userProfile: data);
      } else {
        yield LoginFailedState(message: "${response["message"]}");
        // await Future.delayed(Duration(seconds: 1));
        yield LoggedoutState();
      }
    } catch (_) {
      yield LoginFailedState(message: "Error while logged in");
    }
  }

//logic for logoutbuttonpressed
  Stream<LoginState> logoutButtonPressed(
      LogoutButtonPressedEvent logoutButtonPressedEvent) async* {
    yield InitState();
    try {
      var logoutRes = await LoginAPI.logout();
      if (logoutRes["status"] == "success") {
        deleteLogin();
        yield LoggedoutState();
      } else {
        yield LoginFailedState(message: "${logoutRes["message"]}");
      }
    } catch (_) {
      yield LoginFailedState(message: "Logout not successfull");
    }
  }
}
