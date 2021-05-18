import 'package:flutter/material.dart';
import 'package:cowin_portal/Apicalls/ApiByState.dart';
import 'package:cowin_portal/Apicalls/ApiByDistrict.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String _myState;
String _myCity;

class NewDrop extends StatefulWidget {
  @override
  _NewDropState createState() => _NewDropState();
}

class _NewDropState extends State<NewDrop> {
  List<IndiaStates> statesList = [];
  List<District> citiesList = [];

  String CalendarBypinapi =
      "https://cdn-api.co-vin.in/api/v2/admin/location/states";

  Future<String> fetchDataCalendarByPin() async {
    statesList = [];

    http.Response response = await http.get(Uri.parse(CalendarBypinapi));
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map districtData = jsonDecode(response.body);

      List<dynamic> data = districtData["states"];

      setState(() {
        statesList = data.map((json) => IndiaStates.fromJson(json)).toList();
      });
      //  print('sucess');
      return 'sucess';
    } else {
      throw Exception(' something went wrong ${response.statusCode}');
    }
  }

  Future<String> fetchDataByDistrictApi(String stateId) async {
    citiesList = [];
    // print(citiesList);
    String districtApi =
        "https://cdn-api.co-vin.in/api/v2/admin/location/districts/$stateId";
    // print(districtApi);
    http.Response response = await http.get(Uri.parse(districtApi));

    if (response.statusCode == 200) {
      Map districtData = jsonDecode(response.body);
      List<dynamic> data = districtData['districts'];

      // print('districts');
      //  print(stateId);
      //  print(data);

      setState(() {
        citiesList = data.map((json) => District.fromJson(json)).toList();
      });
      // print('cities sucesss ');

      //  for (int i = 0; i < citiesList.length; i++)
      //   print(citiesList[i].districtId);

      return 'sucess';
    } else {
      throw Exception(' district cannot be displayed ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    print('1');
    this.fetchDataCalendarByPin();

    print('state');

    //for (int i = 0; i < statesList.length; i++) print(statesList[i].stateName);
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                  value: _myState != null ? _myState : null,
                  iconSize: 30,
                  icon: (null),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  hint: Text('Select State'),
                  onChanged: (String newValue) {
                    print(newValue);

                    setState(() {
                      _myState = newValue;

                      _myCity = null;

                      fetchDataByDistrictApi(_myState.toString());

                      //  print(_myState);
                    });
                  },
                  items: statesList?.map<DropdownMenuItem<String>>((item) {
                        //   print(item.stateId);
                        //   print(item.stateName);
                        return new DropdownMenuItem(
                          child: Text(item.stateName.toString()),
                          value: item.stateId.toString(),
                        );
                      })?.toList() ??
                      [],
                ),
              )))
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      value: _myCity != null ? _myCity : null,
                      iconSize: 30,
                      icon: (null),
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                      hint: Text('Select City'),
                      onChanged: (String newValue) {
                        setState(() {
                          _myCity = newValue != null ? newValue : null;

                          print(_myCity);
                        });
                      },
                      items: citiesList?.map<DropdownMenuItem<String>>((item) {
                            // print('inmapitemms');
                            print(item.districtId.toString());
                            return new DropdownMenuItem(
                              child: new Text(item.districtName.toString()),
                              value: item.districtId.toString(),
                            );
                          })?.toList() ??
                          [],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
