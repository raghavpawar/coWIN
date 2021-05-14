import 'package:cowin_portal/Widgets/vaccine_list.dart';
import 'package:flutter/material.dart';
import 'package:cowin_portal/Widgets/filter_card.dart';

class PincodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterCard(),
        SizedBox(
          height: 20,
        ),
        VaccineList(),
      ],
    );
  }
}
