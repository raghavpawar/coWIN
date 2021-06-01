import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cowin_portal/Utils/district_id_data.dart';
import 'package:cowin_portal/Widgets/filter_card.dart';
import 'package:cowin_portal/Widgets/vaccine_list.dart';

class VaccineListData extends StatelessWidget {
  final futureCallback;
  VaccineListData({@required this.futureCallback});

  @override
  Widget build(BuildContext context) {
    return Consumer<DistrictIdData>(
      builder: (context, data, child) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              FilterCard(),
              FutureBuilder(
                  future: futureCallback,
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
                          Widget callVaccineCardClass() {
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
                          }

                          if (snapshot.data[index].availableCapacity != 0) {
                            if (data.age != null ||
                                data.vaccine != null ||
                                data.price != null) {
                              if (data.counter == 1 &&
                                  (snapshot.data[index].minAgeLimit ==
                                          data.age ||
                                      snapshot.data[index].vaccine
                                              .toString()
                                              .substring(8) ==
                                          data.vaccine ||
                                      snapshot.data[index].feeType
                                              .toString()
                                              .substring(8) ==
                                          data.price)) {
                                return callVaccineCardClass();
                              } else if (data.counter == 2 &&
                                  ((snapshot.data[index].minAgeLimit ==
                                              data.age &&
                                          snapshot.data[index].vaccine
                                                  .toString()
                                                  .substring(8) ==
                                              data.vaccine) ||
                                      (snapshot.data[index].minAgeLimit ==
                                              data.age &&
                                          snapshot.data[index].feeType
                                                  .toString()
                                                  .substring(8) ==
                                              data.price) ||
                                      (snapshot.data[index].feeType
                                                  .toString()
                                                  .substring(8) ==
                                              data.price &&
                                          snapshot.data[index].vaccine
                                                  .toString()
                                                  .substring(8) ==
                                              data.vaccine))) {
                                return callVaccineCardClass();
                              } else if (data.counter == 3 &&
                                  (snapshot.data[index].minAgeLimit ==
                                          data.age &&
                                      snapshot.data[index].vaccine
                                              .toString()
                                              .substring(8) ==
                                          data.vaccine &&
                                      snapshot.data[index].feeType
                                              .toString()
                                              .substring(8) ==
                                          data.price)) {
                                return callVaccineCardClass();
                              } else
                                return SizedBox(height: 0, width: 0);
                            }
                            return callVaccineCardClass();
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
      },
    );
  }
}
