import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cowin_portal/constants.dart';

Future<bool> checkPincode(String value) async {
  http.Response response = await http.get(Uri.parse(pincodeApi + value));
  if (jsonDecode(response.body)[0]['Status'] == "Error" ||
      jsonDecode(response.body)[0]['Status'] == "404") {
    return false;
  } else {
    return true;
  }
}
