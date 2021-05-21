import 'package:cowin_portal/Screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cowin_portal/constants.dart';
import 'package:cowin_portal/Apicalls/ApiByState.dart';
import 'package:cowin_portal/Apicalls/ApiByDistrict.dart';
import 'state_drop_down.dart';
import 'district_drop_down.dart';

String _myState;
String _myCity;

class DropDowns extends StatefulWidget {
  @override
  _DropDownsState createState() => _DropDownsState();
}

class _DropDownsState extends State<DropDowns> {
  List<IndiaStates> statesList = [];
  List<District> citiesList = [];

  Future<String> fetchStateData() async {
    statesList = [];

    http.Response response = await http.get(Uri.parse(stateDataApi));
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map districtData = jsonDecode(response.body);

      List<dynamic> data = districtData["states"];

      setState(() {
        statesList = data.map((json) => IndiaStates.fromJson(json)).toList();
      });
      return 'sucess';
    } else {
      throw Exception(' something went wrong ${response.statusCode}');
    }
  }

  Future<String> fetchDistrictData(String stateId) async {
    citiesList = [];

    http.Response response =
        await http.get(Uri.parse(districtDataApi + "/$stateId"));

    if (response.statusCode == 200) {
      Map districtData = jsonDecode(response.body);
      List<dynamic> data = districtData['districts'];

      setState(() {
        citiesList = data.map((json) => District.fromJson(json)).toList();
      });

      return 'sucess';
    } else {
      throw Exception(' district cannot be displayed ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    this.fetchStateData();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        StateDropDown(
          myState: _myState,
          statesList: statesList,
          onChangedCallback: (String newValue) {
            setState(() {
              _myState = newValue;
              pincodeText.clear();

              _myCity = null;

              fetchDistrictData(_myState.toString());
            });
          },
        ),
        SizedBox(
          height: 30,
        ),
        DistrictDropDown(
          citiesList: citiesList,
          myCity: _myCity,
          onChangedCallback: (String newValue) {
            setState(() {
              _myCity = newValue != null ? newValue : null;
              pincodeText.clear();

              print(_myCity);
            });
          },
        )
      ],
    );
  }
}
