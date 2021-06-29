import 'package:flutter/material.dart';

import 'package:cowin_portal/JsonDecoder/StateListDecoder.dart';

class StateDropDown extends StatelessWidget {
  const StateDropDown({
    @required this.statesList,
    @required this.onChangedCallback,
    @required this.myState,
  });

  final List<IndiaStates> statesList;
  final Function onChangedCallback;
  final String myState;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
              child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton<String>(
              elevation: 20,
              value: myState != null ? myState : null,
              iconSize: 24,
              icon: Icon(Icons.keyboard_arrow_down),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Roboto',
              ),
              hint: Text(
                'Select State',
                style: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 18,
                ),
              ),
              onChanged: onChangedCallback,
              items: statesList?.map<DropdownMenuItem<String>>((item) {
                    return new DropdownMenuItem(
                      child: Text(
                        item.stateName.toString(),
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                        ),
                      ),
                      value: item.stateId.toString(),
                    );
                  })?.toList() ??
                  [],
            ),
          )))
        ],
      ),
    );
  }
}
