import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cowin_portal/Widgets/filter_card.dart';
import 'package:cowin_portal/constants.dart';

import '../constants.dart';
import 'package:provider/provider.dart';
import 'package:cowin_portal/Utils/district_id_data.dart';

class FilterButtons extends StatefulWidget {
  final String text;
  final int times;
  final List<String> data;
  final int selectedIndex;
  final int minimumFilterAllowed;

  FilterButtons(
      {this.text,
      this.times,
      this.data,
      this.selectedIndex,
      this.minimumFilterAllowed});

  @override
  _FilterButtonsState createState() => _FilterButtonsState(
      selectedIndex: selectedIndex, minimumFilterAllowed: minimumFilterAllowed);
}

class _FilterButtonsState extends State<FilterButtons> {
  int selectedIndex;
  int minimumFilterAllowed;
  _FilterButtonsState({this.selectedIndex, this.minimumFilterAllowed});
  @override
  Widget build(BuildContext context) {
    void filterFunctionCall(String value) {
      if (widget.text.contains('Date')) {
        Provider.of<DistrictIdData>(context, listen: false).changeDate(value);
      }
      if (widget.text.contains('Age')) {
        if (selectedIndex != null) {
          Provider.of<DistrictIdData>(context, listen: false)
              .applyAgeFilter(value);
          if (Provider.of<DistrictIdData>(context, listen: false).counter ==
                  0 ||
              ((Provider.of<DistrictIdData>(context, listen: false).counter ==
                          1 ||
                      Provider.of<DistrictIdData>(context, listen: false)
                              .counter ==
                          2) &&
                  Provider.of<DistrictIdData>(context, listen: false)
                          .ageCounter ==
                      0)) {
            Provider.of<DistrictIdData>(context, listen: false)
                .increaseCounter();
            Provider.of<DistrictIdData>(context, listen: false)
                .increaseAgeCounter();
          }
        } else
          Provider.of<DistrictIdData>(context, listen: false).nullifyAge();
      }
      if (widget.text.contains('Vaccine')) {
        if (selectedIndex != null) {
          Provider.of<DistrictIdData>(context, listen: false)
              .applyVaccineFilter(value);
          if (Provider.of<DistrictIdData>(context, listen: false).counter ==
                  0 ||
              ((Provider.of<DistrictIdData>(context, listen: false).counter ==
                          1 ||
                      Provider.of<DistrictIdData>(context, listen: false)
                              .counter ==
                          2) &&
                  Provider.of<DistrictIdData>(context, listen: false)
                          .vaccineCounter ==
                      0)) {
            Provider.of<DistrictIdData>(context, listen: false)
                .increaseCounter();
            Provider.of<DistrictIdData>(context, listen: false)
                .increaseVaccineCounter();
          }
        } else
          Provider.of<DistrictIdData>(context, listen: false).nullifyVaccine();
      }
      if (widget.text.contains('Price')) {
        if (selectedIndex != null) {
          Provider.of<DistrictIdData>(context, listen: false)
              .applyPriceFilter(value);
          if (Provider.of<DistrictIdData>(context, listen: false).counter ==
                  0 ||
              ((Provider.of<DistrictIdData>(context, listen: false).counter ==
                          1 ||
                      Provider.of<DistrictIdData>(context, listen: false)
                              .counter ==
                          2) &&
                  Provider.of<DistrictIdData>(context, listen: false)
                          .priceCounter ==
                      0)) {
            Provider.of<DistrictIdData>(context, listen: false)
                .increaseCounter();
            Provider.of<DistrictIdData>(context, listen: false)
                .increasePriceCounter();
          }
        } else
          Provider.of<DistrictIdData>(context, listen: false).nullifyPrice();
      }
    }

    return Row(
      children: [
        FilterTile(
          text: widget.text,
        ),
        Flexible(
          child: Container(
            color: Colors.transparent,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                // _getListData(),
                Container(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: widget.times,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (minimumFilterAllowed == 0) {
                                    if (selectedIndex != index) {
                                      selectedIndex = index;
                                      filterFunctionCall(
                                          widget.data[index].toString());
                                    } else {
                                      selectedIndex = null;
                                      filterFunctionCall(
                                          widget.data[index].toString());
                                    }
                                  } else {
                                    selectedIndex = index;
                                    filterFunctionCall(
                                        widget.data[index].toString());
                                  }
                                });
                                // Respond to button press
                              },
                              child: Text(
                                widget.data[index].toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontFamily: 'sora',
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: kcolorBlue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  side: BorderSide(
                                    color: kcolorYellow,
                                    width: selectedIndex != null &&
                                            selectedIndex == index
                                        ? 3
                                        : 1,
                                  )),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        );
                      }),
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
