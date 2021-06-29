import 'package:cowin_portal/Networking/check_internet.dart';
import 'package:cowin_portal/Screens/main_screen.dart';
import 'package:cowin_portal/Screens/no_internet_screen.dart';
import 'package:cowin_portal/Widgets/drop_downs.dart';
import 'package:cowin_portal/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cowin_portal/Provider/district_id_data.dart';
import 'package:cowin_portal/Widgets/search_button.dart';
import 'package:cowin_portal/Networking/check_pincode.dart';

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
    void hasInternet(value) async {
      buildShowDialog(context);
      bool isPincodeCorrect = await checkPincode(value);
      if (isPincodeCorrect) {
        Navigator.pop(context);
        setState(() {
          errorMessage = null;
        });
        Provider.of<DistrictIdData>(context, listen: false).toggleButton();
        if (Provider.of<DistrictIdData>(context, listen: false)
            .isButtonEnabled) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                Provider.of<DistrictIdData>(context, listen: false)
                    .initializePincode(pincodeText.text);
                return MainScreen();
              },
            ),
          );
        }
      } else {
        Navigator.pop(context);
        setState(() {
          errorMessage = "Invalid Pincode!";
        });
      }
    }

    return Consumer<DistrictIdData>(
      builder: (context, data, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: kcolorWhite,
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
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
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
                              data.nullifyState();
                              data.nullifyCity();
                              await checkInternet()
                                  ? hasInternet(value)
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return NoInternetScreen();
                                        },
                                      ),
                                    );
                            },
                            controller: pincodeText,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                              errorText: this.errorMessage,
                              contentPadding:
                                  EdgeInsets.only(left: 18, bottom: 12),
                              labelText: 'Enter your Pincode',
                              labelStyle: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF575757),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            'OR',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: kcolorBlue),
                          ),
                          SizedBox(
                            height: 27,
                          ),
                          DropDowns(),
                          SizedBox(
                            height: 55,
                          ),
                          SearchButton(
                            buttonText: 'Search',
                            color: kcolorYellow,
                            textColor: kcolorBlue,
                            onPressedCallback: data.isButtonEnabled
                                ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          data.initializePincode(
                                              pincodeText.text);
                                          return MainScreen();
                                        },
                                      ),
                                    );
                                  }
                                : null,
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          SearchButton(
                            buttonText: 'Search by Map',
                            color: kcolorBlue,
                            textColor: Color(0xfffbfbfb),
                            icon: Icons.my_location,
                            onPressedCallback: null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
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
