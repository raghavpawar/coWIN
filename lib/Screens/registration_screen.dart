import 'dart:convert';

import 'package:cowin_portal/Screens/main_screen.dart';
import 'package:cowin_portal/Widgets/drop_downs.dart';
import 'package:cowin_portal/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:cowin_portal/Utils/district_id_data.dart';

TextEditingController pincodeText = TextEditingController();

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  void dispose() {
    super.dispose();
    pincodeText.dispose();
  }

  String errorMessage;

  Widget build(BuildContext context) {
    Future<String> checkPincode(String value) async {
      http.Response response = await http.get(Uri.parse(pincodeApi + value));
      if (jsonDecode(response.body)[0]['Status'] == "Error" ||
          jsonDecode(response.body)[0]['Status'] == "404") {
        setState(() {
          errorMessage = 'Invalid Pincode!';
        });
        return 'Wrong';
      } else {
        Provider.of<DistrictIdData>(context, listen: false).toggleButton();
        setState(() {
          errorMessage = null;
        });
        return "Right";
      }
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                        onSubmitted: (value) async {
                          Provider.of<DistrictIdData>(context, listen: false)
                              .nullifyState();
                          Provider.of<DistrictIdData>(context, listen: false)
                              .nullifyCity();
                          buildShowDialog(context);
                          await checkPincode(value);
                          Navigator.pop(context);
                          if (Provider.of<DistrictIdData>(context,
                                  listen: false)
                              .isButtonEnabled) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  Provider.of<DistrictIdData>(context,
                                          listen: false)
                                      .initializePincode(pincodeText.text);
                                  return MainScreen();
                                },
                              ),
                            );
                          }
                        },
                        controller: pincodeText,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          errorText: this.errorMessage,
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
                      DropDowns(),
                      SizedBox(
                        height: 83,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color: kcolorYellow,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: double.infinity,
                          child: TextButton(
                            onPressed: Provider.of<DistrictIdData>(
                              context,
                            ).isButtonEnabled
                                ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          Provider.of<DistrictIdData>(context,
                                                  listen: false)
                                              .initializePincode(
                                                  pincodeText.text);
                                          return MainScreen();
                                        },
                                      ),
                                    );
                                  }
                                : null,
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
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
