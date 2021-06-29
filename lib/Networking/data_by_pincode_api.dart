import 'package:http/http.dart' as http;
import 'package:cowin_portal/constants.dart';
import 'dart:convert';
import 'package:cowin_portal/JsonDecoder/SessionsDecoder.dart';

List<Session> sessionByPin;

// ignore: missing_return
Future<List<Session>> fetchDataByPincodeApi(String pincode, String date) async {
  http.Response response = await http
      .get(Uri.parse(sessionByPincodeApi + "pincode=$pincode&date=$date"));

  if (response.statusCode == 200) {
    Map sessionsData = jsonDecode(response.body);
    List<dynamic> data = sessionsData['sessions'];

    sessionByPin = data.map((json) => Session.fromJson(json)).toList();
    return sessionByPin;
  } else
    Exception(response.statusCode);
}
