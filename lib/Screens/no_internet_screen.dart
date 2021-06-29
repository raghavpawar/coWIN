import 'package:cowin_portal/Provider/district_id_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

TextEditingController pincodeText = TextEditingController();

class NoInternetScreen extends StatefulWidget {
  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DistrictIdData>(builder: (context, data, child) {
      return Scaffold(
          body: Center(
              child: Text(
        'No Internet!',
        style: TextStyle(
          fontSize: 80,
        ),
      )));
    });
  }
}
