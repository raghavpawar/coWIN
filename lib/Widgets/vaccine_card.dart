import 'package:cowin_portal/Apicalls/ApiSessions.dart';
import 'package:cowin_portal/constants.dart';
import 'package:flutter/material.dart';

class VaccineCard extends StatelessWidget {
  final String name;
  final String address;
  final String blockName;
  final String districtName;
  final String stateName;
  final int pincode;
  final int availableCapacity;
  final Vaccine vaccine;
  final int minAgeLimit;

  VaccineCard({
    this.address,
    this.availableCapacity,
    this.blockName,
    this.districtName,
    this.minAgeLimit,
    this.name,
    this.pincode,
    this.stateName,
    this.vaccine,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kcolorBlue,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.only(left: 17, top: 15, right: 7, bottom: 12),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.white),
                  ),
                  Text(
                    blockName == "Not Applicable"
                        ? "$address, $districtName, $stateName, $pincode"
                        : "$address, $blockName, $districtName, $stateName, $pincode",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: availableCapacity <= 10
                          ? kcolorYellow
                          : Color(0xff00DC65),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    alignment: Alignment.center,
                    width: 50,
                    height: 25,
                    // padding: EdgeInsets.all(5),
                    child: Text(
                      availableCapacity.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    vaccine
                        .toString()
                        .split('.')
                        .last
                        .replaceFirst('COVAXIN', 'Covaxin')
                        .replaceFirst('COVISHIELD', 'Covishield')
                        .replaceFirst('SPUTNIK V', 'Sputnik V'),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Text(
                    "Age $minAgeLimit+",
                    style: TextStyle(
                      color: Color(0xffFF2323),
                      fontSize: 12,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
