import 'package:cowin_portal/Screens/main_screen.dart';
import 'package:cowin_portal/Widgets/drop_down_button.dart';
import 'package:cowin_portal/Widgets/newdropdown.dart';
import 'package:cowin_portal/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    'coWIN',
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: kcolorBlue),
                  ),
                  Opacity(
                    opacity: 0.23,
                    child: Container(
                      height: 262,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage('images/vaccine1.jpg'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 52,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 18, bottom: 12),
                        labelText: 'Enter your Pincode',
                        labelStyle: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'OR',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: kcolorBlue),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    NewDrop(),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 83,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: kcolorYellow,
                          borderRadius: BorderRadius.circular(10)),
                      // height: 51,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.all(11),
                        ),
                        child: Text(
                          'Search',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: kcolorBlue),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
