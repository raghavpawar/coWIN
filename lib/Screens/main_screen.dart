import 'package:cowin_portal/Screens/registration_screen.dart';
import 'package:cowin_portal/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cowin_portal/Provider/district_id_data.dart';
import 'package:cowin_portal/Widgets/vaccine_list.dart';
import 'package:cowin_portal/Networking/data_by_district_api.dart';
import 'package:cowin_portal/Networking/data_by_pincode_api.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

DateTime lastQuit;

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (lastQuit == null ||
            DateTime.now().difference(lastQuit).inSeconds > 1) {
          pincodeText.clear();
          Provider.of<DistrictIdData>(context, listen: false)
              .intializeCity(null);
          Provider.of<DistrictIdData>(context, listen: false)
              .initializeState(null);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 1),
            backgroundColor: kcolorYellow,
            content: Text(
              'Press back button again to go back!',
              style: TextStyle(
                color: kcolorBlue,
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
      child: Consumer<DistrictIdData>(builder: (context, data, child) {
        return Scaffold(
          backgroundColor: kcolorWhite,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: kcolorBlue,
                size: 18,
              ),
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
          ),
          body: Column(
            children: [
              Container(
                color: kcolorBlue,
                height: 68,
                width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        data.recievedPincode == "" ? 'District' : 'Pin Code',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      flex: data.recievedPincode == "" ? 4 : 2,
                      child: Text(
                        data.recievedPincode == ""
                            ? '${data.cityName},${data.statename}'
                            : data.recievedPincode,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffcdd1dd),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  child: VaccineListData(
                    futureCallback: data.recievedPincode == ""
                        ? fetchDataByDistrictApi(
                            data.recievedDistrictId,
                            data.newDate,
                          )
                        : fetchDataByPincodeApi(
                            data.recievedPincode,
                            data.newDate,
                          ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
