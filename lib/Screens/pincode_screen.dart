import 'package:cowin_portal/Widgets/vaccine_list.dart';
import 'package:flutter/material.dart';
import 'package:cowin_portal/Widgets/filter_card.dart';
import 'package:cowin_portal/Apicalls/ApiSessionByDistrict.dart';

class PincodeScreen extends StatelessWidget {
  final String pincode;
  PincodeScreen({@required this.pincode});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FilterCard(),
          Column(
            children: [
              FutureBuilder(
                  future: fetchDataByPincodeApi(pincode),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Container(child: CircularProgressIndicator());
                    }

                    print(snapshot.data.length);

                    return ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (snapshot.data[index].availableCapacity != 0) {
                          return VaccineCard(
                            name: snapshot.data[index].name,
                            address: snapshot.data[index].address,
                            blockName: snapshot.data[index].blockName,
                            districtName: snapshot.data[index].districtName,
                            stateName: snapshot.data[index].stateName,
                            pincode: snapshot.data[index].pincode,
                            availableCapacity:
                                snapshot.data[index].availableCapacity,
                            vaccine: snapshot.data[index].vaccine,
                            minAgeLimit: snapshot.data[index].minAgeLimit,
                          );
                        } else
                          return SizedBox(
                            height: 0,
                            width: 0,
                          );
                      },
                      itemCount: snapshot.data.length,
                    );
                  })
            ],
          ),
        ],
      ),
    );
  }
}
