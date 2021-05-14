import 'package:flutter/material.dart';

class DropDownButton extends StatelessWidget {
  DropDownButton({this.dropDownValue, this.onChangedCallback, this.hintText});
  final String dropDownValue;
  final Function onChangedCallback;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton(
        isExpanded: true,
        hint: Text(hintText),
        value: dropDownValue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        onChanged: onChangedCallback,
        items: <String>['One', 'Two', 'Three', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
