import 'package:flutter/material.dart';

import 'package:cowin_portal/JsonDecoder/DistrictListDecoder.dart';

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
