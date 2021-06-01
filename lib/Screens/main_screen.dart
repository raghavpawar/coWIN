import 'package:cowin_portal/Screens/district_screen.dart';
import 'package:cowin_portal/Screens/pincode_screen.dart';
import 'package:cowin_portal/Screens/registration_screen.dart';
import 'package:cowin_portal/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cowin_portal/Utils/district_id_data.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DistrictIdData>(builder: (context, data, child) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                data.nullifyCounters();
                data.disableButton();
                data.nullifyState();
                data.nullifyCity();
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
              PincodeScreen(),
              DistrictScreen(),
            ],
          ),
        ),
      );
    });
  }
}
