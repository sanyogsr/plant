import 'package:flutter/material.dart';
import 'package:plant/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.blackColor,
      body: Center(
        child: Text(
          "hiii i am home page",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
