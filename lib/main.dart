import 'package:flutter/material.dart';
// import 'package:plant/ui/onboarding.dart';
import 'package:plant/ui/onboarding_screen.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}
