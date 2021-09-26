import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_system_bloc/bloc/login/login_bloc.dart';
import 'package:flutter_login_system_bloc/bloc/login/login_event.dart';
import 'package:flutter_login_system_bloc/bloc/login/login_state.dart';
import 'package:flutter_login_system_bloc/screen/create_account.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();

  final _formvalid = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Form(
          key: _formvalid,
          child: Column(
            children: [
              // -----------------------------------TextField - Email--------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: TextFormField(
                  controller: emailText,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontSize: 20,
                    ),
                    hintText: 'Enter your Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onChanged: (value) {
                    // print(eData);
                    email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the Email Address';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // -----------------------------------TextField - Password--------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordText,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.blue,
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontSize: 20,
                    ),
                    hintText: 'Enter your Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onChanged: (value) {
                    // print(pData);
                    password = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Your Password should be at least 6 character.';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: 27,
              ),
              // -----------------------------------------login button---------------------
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[500],
                  elevation: 10,
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 70),
                ),
                onPressed: () {
                  if (_formvalid.currentState!.validate()) {
                    context.read<LoginBloc>().add(LoginButtonPressedEvent(
                        email: emailText.text, password: passwordText.text));
                  }
                },
                child: Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don\'t have an Account ?',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: '\b\b Sign up',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        shadows: <Shadow>[
                          Shadow(
                            // offset: Offset(10.0, 10.0),
                            blurRadius: 7.0,
                            color: Colors.grey,
                          ),
                        ],
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          // logOut(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateAccount(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
