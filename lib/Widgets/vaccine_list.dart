import 'package:cowin_portal/constants.dart';
import 'package:flutter/material.dart';

class VaccineList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        VaccineCard(),
        VaccineCard(),
        VaccineCard(),
        VaccineCard(),
      ],
    );
  }
}

class VaccineCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.fromLTRB(33, 0, 33, 14),
        child: Column(
          children: [
            Card(
              color: kcolorBlue,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    EdgeInsets.only(left: 17, top: 15, right: 7, bottom: 12),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BHAGAT SINGH COLONY UPHC',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white),
                          ),
                          Text(
                            'Bhagat Singh Colony Dehradun, Dehradun, Uttarakhand, 248001',
                            style: TextStyle(fontSize: 12, color: Colors.white),
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
                              color: Colors.green,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            alignment: Alignment.center,
                            width: 50,
                            height: 25,
                            // padding: EdgeInsets.all(5),
                            child: Text(
                              '38',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Covishield',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          Text(
                            'Age 45+',
                            style: TextStyle(
                                color: Color(0xffE93535), fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
