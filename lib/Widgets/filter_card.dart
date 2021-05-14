import 'package:flutter/material.dart';

class FilterCard extends StatelessWidget {
  const FilterCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent.shade100,
      padding: EdgeInsets.all(20),
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
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
