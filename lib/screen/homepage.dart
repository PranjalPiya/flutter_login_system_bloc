import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_system_bloc/Api/profile_jsonToDart.dart';
import 'package:flutter_login_system_bloc/bloc/login/login_bloc.dart';
import 'package:flutter_login_system_bloc/bloc/login/login_event.dart';
import 'package:flutter_login_system_bloc/bloc/login/login_state.dart';

// import 'package:login_app/Api/convertJson.dart';
class HomePage extends StatelessWidget {
  final User? activeUser;
  const HomePage({Key? key, required this.activeUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white38,
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  context.read<LoginBloc>().add(LogoutButtonPressedEvent());
                },
                icon: Icon(
                  Icons.logout,
                  size: 20,
                ),
              ),
            ],
            centerTitle: true,
            title: Text('Digital - identity - card'.toUpperCase()),
            backgroundColor: Colors.teal,
          ),
          body: Container(
            height: 800,
            width: 360,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              // color: Colors.blue[200],
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 70, right: 70, top: 5, bottom: 5),
                        child: Text(
                          '${activeUser?.message}',
                          // 'Digital-Identity-Card'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(
                          'https://ikreate.com.np/assets/img/user/intern/S7yWwEQBOzbqnaTRLKD1jruMHGpgisUtV.jpg'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${activeUser?.profile?.fullName}',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${activeUser?.profile?.primaryEmail}',
                      style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${activeUser?.profile?.currentAddress}',
                      style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '+977 - ${activeUser?.profile?.phoneNumber}',
                      style: TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    Image(
                      image: NetworkImage(
                          'https://www.ikreate.com.np/assets/img/qr.png'),
                      fit: BoxFit.cover,
                      height: 65,
                      width: 67,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: Colors.white,
                      ),
                      child: Text(
                        "Valid Since:  ${activeUser!.profile!.regDate}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '${activeUser?.profile?.about}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 30),
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    Image(
                      image: NetworkImage(
                          'https://www.ikreate.com.np/assets/img/stamp.png'),
                      width: 80,
                      height: 80,
                    ),
                    Text(
                      'ikrete technologies'.toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '~',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      '02-Floor - Shivan Building',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontStyle: FontStyle.italic),
                    ),
                    Text(
                      'Budanilkantha 03, Kathmandu, Nepal',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontStyle: FontStyle.italic),
                    ),
                    Text(
                      'www.ikreate.com.np | info@ikreate.com.np',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.teal[300],
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Share Link - iKreate Badge',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
