import 'package:cowin_portal/Widgets/filter_card.dart';
import 'package:cowin_portal/Widgets/vaccine_list.dart';
import 'package:flutter/material.dart';

class DistrictScreen extends StatelessWidget {
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
