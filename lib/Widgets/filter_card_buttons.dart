import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cowin_portal/Widgets/filter_card.dart';
import 'package:cowin_portal/constants.dart';

import '../constants.dart';

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
                                  print(minimumFilterAllowed);
                                  if (minimumFilterAllowed == 0) {
                                    if (selectedIndex != index)
                                      selectedIndex = index;
                                    else
                                      selectedIndex = null;
                                  } else {
                                    selectedIndex = index;
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
