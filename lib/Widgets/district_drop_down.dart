import 'dart:developer';

import 'package:cowin_portal/Provider/district_id_data.dart';
import 'package:flutter/material.dart';

import 'package:cowin_portal/JsonDecoder/DistrictListDecoder.dart';
import 'package:provider/provider.dart';

Map<String, String> districtMAp = {'-1': 'unknown'};

class DistrictDropDown extends StatelessWidget {
  const DistrictDropDown({
    @required this.districtList,
    @required this.myCity,
    @required this.onChangedCallback,
  });

  final List<District> districtList;
  final String myCity;

  final Function onChangedCallback;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Provider.of<DistrictIdData>(context, listen: false)
            .connectDistrictMap(districtMAp));

    return Container(
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
                  value: myCity != null ? myCity : null,
                  iconSize: 24,
                  icon: Icon(Icons.keyboard_arrow_down),
                  style: TextStyle(
                      color: Colors.black, fontSize: 18, fontFamily: 'Roboto'),
                  hint: Text(
                    'Select City',
                    style: TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 18,
                    ),
                  ),
                  onChanged: onChangedCallback,
                  items: districtList?.map<DropdownMenuItem<String>>((item) {
                        districtMAp.putIfAbsent(item.districtId.toString(),
                            () => item.districtName.toString());
                        return new DropdownMenuItem(
                          child: new Text(
                            item.districtName.toString(),
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                            ),
                          ),
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
    );
  }
}
