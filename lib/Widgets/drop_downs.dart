import 'package:cowin_portal/Screens/registration_screen.dart';
import 'package:cowin_portal/Utils/district_id_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cowin_portal/constants.dart';
import 'package:cowin_portal/Apicalls/ApiByState.dart';
import 'package:cowin_portal/Apicalls/ApiByDistrict.dart';
import 'state_drop_down.dart';
import 'district_drop_down.dart';
import 'package:provider/provider.dart';

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
    return Consumer<DistrictIdData>(
      builder: (context, data, child) {
        return Column(
          children: [
            StateDropDown(
              myState: data.myState,
              statesList: statesList,
              onChangedCallback: (String newValue) {
                setState(() {
                  data.initializeState(newValue);
                  pincodeText.clear();
                  data.nullifyCity();
                  fetchDistrictData(data.myState);
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            DistrictDropDown(
              citiesList: citiesList,
              myCity: data.myCity,
              onChangedCallback: (String newValue) {
                setState(() {
                  data.intializeCity(newValue);
                  pincodeText.clear();
                  data.initializeDistrictId(data.myCity);
                  data.toggleButton();
                });
              },
            )
          ],
        );
      },
    );
  }
}
