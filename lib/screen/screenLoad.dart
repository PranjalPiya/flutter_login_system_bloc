import 'package:flutter/material.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: CircularProgressIndicator(
            strokeWidth: 5,
            backgroundColor: Colors.blue,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
