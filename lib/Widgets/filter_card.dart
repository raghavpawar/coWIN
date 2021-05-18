import 'package:cowin_portal/constants.dart';
import 'package:flutter/material.dart';

class FilterCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 38, top: 25),
      child: Column(
        children: [
          FilterTile(
            text: 'Date:',
          ),
          FilterTile(
            text: 'Age:',
          ),
          FilterTile(
            text: 'Vaccine:',
          ),
          FilterTile(
            text: 'Price:',
          )
        ],
      ),
    );
  }
}

class FilterTile extends StatelessWidget {
  final String text;
  FilterTile({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 22),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 18),
          ),
          Container(
            margin: EdgeInsets.only(left: 30),
            width: 104,
            height: 31,
            decoration: BoxDecoration(
              color: kcolorBlue,
              borderRadius: BorderRadius.circular(10),
              // border: Border.all(color: kcolorYellow, width: 3),
            ),
            child: Center(
              child: Text(
                '12 May, 2021',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
