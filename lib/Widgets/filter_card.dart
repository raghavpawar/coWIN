import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cowin_portal/Widgets/filter_card_buttons.dart';

import 'package:intl/intl.dart';

class FilterCard extends StatelessWidget {
  @override
  List<String> dates = [];
  Widget build(BuildContext context) {
    for (int i = 0; i <= 7; i++) {
      dates.add(
          DateFormat.yMMMd().format(DateTime.now().add(Duration(days: i))));
    }

    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            FilterButtons(
              text: 'Date :       ',
              times: 7,
              data: dates,
              selectedIndex: 0,
              minimumFilterAllowed: 1,
            ),
            FilterButtons(
              text: 'Age :         ',
              times: 2,
              data: ['18+', '45+'],
              minimumFilterAllowed: 0,
            ),
            FilterButtons(
                text: 'Vaccine :',
                times: 3,
                data: ['Covaxin', 'Covishield', 'Sputnik V']),

            FilterButtons(
              text: 'Price :      ',
              times: 2,
              data: ['Free', 'Paid'],
              minimumFilterAllowed: 0,
            ),
          ],
        ),
      ),
    );
  }
}

class FilterTile extends StatelessWidget {
  final String text;
  FilterTile({this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
