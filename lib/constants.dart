import 'package:flutter/material.dart';

final kcolorBlue = Color(0xFF081F5C);
final kcolorYellow = Color(0xFFF3BF41);
final kcolorWhite = Color(0xFFFDFDFD);

const String stateDataApi =
    "https://cdn-api.co-vin.in/api/v2/admin/location/states";

const String districtDataApi =
    "https://cdn-api.co-vin.in/api/v2/admin/location/districts";

const String sessionByDistrictApi =
    "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByDistrict?";

const String sessionByPincodeApi =
    "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?";

const String pincodeApi = "https://api.postalpincode.in/pincode/";
