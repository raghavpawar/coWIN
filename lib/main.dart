import 'package:cowin_portal/Screens/registration_screen.dart';
import 'package:cowin_portal/Provider/district_id_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/registration_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DistrictIdData(),
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Sora'),
        debugShowCheckedModeBanner: false,
        title: 'Cowin App',
        home: RegistrationScreen(),
      ),
    );
  }
}
