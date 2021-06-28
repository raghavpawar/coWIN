import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final String buttonText;
  final Color color;
  final Color textColor;
  final IconData icon;
  final Function onPressedCallback;
  SearchButton(
      {this.buttonText,
      this.color,
      this.textColor,
      this.icon,
      @required this.onPressedCallback});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: TextButton(
            onPressed: onPressedCallback,
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(13),
            ),
            child: icon == null
                ? Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                  )
                : Row(
                    children: [
                      SizedBox(
                        width: 89,
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          buttonText,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: textColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Icon(
                          icon,
                          color: Color(0xfffbfbfb),
                        ),
                      ),
                    ],
                  )));
  }
}
