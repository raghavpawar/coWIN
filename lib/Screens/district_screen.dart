import 'package:cowin_portal/Apicalls/ApiSessionByDistrict.dart';
import 'package:cowin_portal/Widgets/filter_card.dart';
import 'package:cowin_portal/Widgets/vaccine_list.dart';
import 'package:flutter/material.dart';

class DistrictScreen extends StatelessWidget {
  // final String districtId;
  // DistrictScreen({@required this.districtId});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          FilterCard(),
          FutureBuilder(
              future: fetchDataByDistrictApi('704'),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(child: CircularProgressIndicator());
                }

                return ListView.builder(
                    physics: ScrollPhysics(),
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
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
                    });
              })
        ],
      ),
    );
  }
}
