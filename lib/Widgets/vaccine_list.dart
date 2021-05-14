import 'package:flutter/material.dart';

class VaccineList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.grey,
        child: Column(
          children: [
            VaccineCard(),
          ],
        ),
      ),
    );
  }
}

class VaccineCard extends StatelessWidget {
  const VaccineCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(10),
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
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Bhagat Singh Colony Dehradun, Dehradun, Uttarakhand, 248001',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
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
                    alignment: Alignment.center,
                    width: 50,
                    height: 25,
                    // padding: EdgeInsets.all(5),
                    color: Colors.green,
                    child: Text('38'),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Covishield',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Age 45+',
                    style: TextStyle(color: Colors.red),
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
