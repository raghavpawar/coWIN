import 'package:cowin_portal/Utils/vaccine_list_data.dart';
import 'package:flutter/material.dart';
import 'package:cowin_portal/constants.dart';
import 'package:cowin_portal/Apicalls/ApiSessionByDistrict.dart';
import 'package:provider/provider.dart';
import 'package:cowin_portal/Utils/district_id_data.dart';

DateTime lastQuit;

class DistrictScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (lastQuit == null ||
            DateTime.now().difference(lastQuit).inSeconds > 1) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 1),
            backgroundColor: kcolorYellow,
            content: Text(
              'Press back button again to go back!',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
              ),
            ),
          ));
          lastQuit = DateTime.now();
          return false;
        } else {
          Navigator.of(context).pop(true);
          return true;
        }
      },
      child: VaccineListData(
        futureCallback: fetchDataByDistrictApi(
          Provider.of<DistrictIdData>(context).recievedDistrictId,
          Provider.of<DistrictIdData>(context).newDate,
        ),
      ),
    );
  }
}
