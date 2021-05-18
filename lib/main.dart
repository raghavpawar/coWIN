import 'package:cowin_portal/Screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'Screens/registration_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Sora'),
      debugShowCheckedModeBanner: false,
      title: 'Cowin App',
      home: RegistrationScreen(),
    );
  }
}
