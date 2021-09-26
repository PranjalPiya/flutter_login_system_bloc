import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_system_bloc/screen/login_textform.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  // String? eData;
  // String? pData;
  final _validForm = GlobalKey<FormState>();
  TextEditingController nameTextR = TextEditingController();
  TextEditingController emailTextR = TextEditingController();
  TextEditingController newPasswordTextR = TextEditingController();
  TextEditingController rePasswordTextR = TextEditingController();

  // TextEditingController emailText = TextEditingController();
  // TextEditingController passwordText = TextEditingController();
  // final _formvalid = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/signin_background.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 23),
                  color: Color(0xFF3b5999).withOpacity(.75),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          'Create Account',
                          style: GoogleFonts.oswald(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          'Enter your Name, Email and\nPassword for Sign up',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 40),
                      //   child: Text(
                      //     'Please provide the below details',
                      //     style: TextStyle(
                      //       fontSize: 16,
                      //       color: Colors.white,
                      //       fontStyle: FontStyle.italic,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 40,
              top: 200,
              right: 40,
              height: 450,
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Form(
                      key: _validForm,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            child: TextFormField(
                              controller: nameTextR,
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.blue,
                                ),
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                ),
                                hintText: 'Enter your Full Name',
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
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter the Full Name';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            child: TextFormField(
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
                                hintText: 'Enter your Email Address',
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
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            child: TextFormField(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.blue,
                                ),
                                labelText: 'New Password',
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
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter the Password';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue[500],
                                elevation: 10,
                                shape: StadiumBorder(),
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 70),
                              ),
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Already have an Account ?',
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\b\b Login',
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
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Login(),
                                          ),
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
