// import 'dart:developer';

// import 'package:cowin_portal/JsonDecoder/DistrictListDecoder.dart';
// import 'package:cowin_portal/Provider/district_id_data.dart';
// import 'package:flutter/material.dart';

// import 'package:cowin_portal/JsonDecoder/StateListDecoder.dart';
// import 'package:provider/provider.dart';

// Map<String, String> stateMap = {'-1': 'unknown'};

// class StateDropDown extends StatelessWidget {
//   const StateDropDown({
//     @required this.statesList,
//     @required this.onChangedCallback,
//     @required this.myState,
//   });

//   final List<IndiaStates> statesList;
//   final Function onChangedCallback;
//   final String myState;

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<DistrictIdData>(builder: (context, data, child) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         print(stateMap);
//         data.connectStateMap(stateMap);
//       });
//       return Container(
//         padding: EdgeInsets.only(left: 15, right: 15, top: 5),
//         color: Colors.white,
//         child: Row(
//           children: <Widget>[
//             Expanded(
//                 child: DropdownButtonHideUnderline(
//                     child: ButtonTheme(
//               alignedDropdown: true,
//               child: DropdownButton<String>(
//                 elevation: 20,
//                 value: myState != null ? myState : null,
//                 iconSize: 24,
//                 icon: Icon(Icons.keyboard_arrow_down),
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                   fontFamily: 'Roboto',
//                 ),
//                 hint: Text(
//                   'Select State',
//                   style: TextStyle(
//                     fontFamily: 'Sora',
//                     fontSize: 18,
//                   ),
//                 ),
//                 onChanged: onChangedCallback,
//                 items: statesList?.map<DropdownMenuItem<String>>((item) {
//                       // log(item.stateId.toString());
//                       stateMap.putIfAbsent(item.stateId.toString(),
//                           () => item.stateName.toString());

//                       return new DropdownMenuItem(
//                         child: Text(
//                           item.stateName.toString(),
//                           style: TextStyle(
//                             fontFamily: 'Roboto',
//                             fontSize: 18,
//                           ),
//                         ),
//                         value: item.stateId.toString(),
//                       );
//                     })?.toList() ??
//                     [],
//               ),
//             )))
//           ],
//         ),
//       );
//     });
//   }
// }

import 'dart:developer';

import 'package:cowin_portal/JsonDecoder/DistrictListDecoder.dart';
import 'package:cowin_portal/Provider/district_id_data.dart';
import 'package:flutter/material.dart';

import 'package:cowin_portal/JsonDecoder/StateListDecoder.dart';
import 'package:provider/provider.dart';

Map<String, String> stateMap = {'-1': 'unknown'};

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
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Provider.of<DistrictIdData>(context, listen: false)
            .connectStateMap(stateMap));
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
                    log(item.stateId.toString());
                    stateMap.putIfAbsent(item.stateId.toString(),
                        () => item.stateName.toString());

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
