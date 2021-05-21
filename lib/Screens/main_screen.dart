import 'package:cowin_portal/Screens/district_screen.dart';
import 'package:cowin_portal/Screens/pincode_screen.dart';
import 'package:cowin_portal/Screens/registration_screen.dart';
import 'package:cowin_portal/constants.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final String pincode;
  MainScreen(this.pincode);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.home),
            color: Colors.white,
            onPressed: () {
              setState(() {
                pincodeText.clear();
                Navigator.pop(context);
              });
            },
          ),
          backgroundColor: kcolorYellow,
          title: Text(
            'coWIN',
            style: TextStyle(fontSize: 20, color: kcolorBlue),
          ),
          bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              labelColor: Colors.white,
              tabs: [
                Tab(
                  child: Text(
                    'PIN CODE',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Tab(
                  child: Text(
                    'DISTRICT',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            PincodeScreen(
              pincode: widget.pincode,
            ),
            DistrictScreen(),
          ],
        ),
      ),
    );
  }
}
