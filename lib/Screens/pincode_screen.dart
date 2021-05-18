import 'package:cowin_portal/Widgets/vaccine_list.dart';
import 'package:flutter/material.dart';
import 'package:cowin_portal/Widgets/filter_card.dart';
import 'package:cowin_portal/Apicalls/ApiSessionByDistrict.dart';

import 'registration_screen.dart';

String pincode = pincodeText.text;

class PincodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FilterCard(),
          FutureBuilder(
              future: fetchDataBySessions(pincode),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(child: Text('Loading.....'));
                }

                print(snapshot.data.length);

                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return VaccineCard();
                    },
                    itemCount: snapshot.data.length);
              }),
        ],
      ),
    );
  }
}

/*
 return Column(
      children: [
        FilterCard(),
        SizedBox(
          height: 20,
        ),
        VaccineList(),
      ],
    );
 */
