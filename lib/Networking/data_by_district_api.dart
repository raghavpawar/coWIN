import 'package:http/http.dart' as http;
import 'package:cowin_portal/constants.dart';
import 'dart:convert';
import 'package:cowin_portal/JsonDecoder/SessionsDecoder.dart';

List<Session> sessionByDistrict;

// ignore: missing_return
Future<List<Session>> fetchDataByDistrictApi(
    String districtId, String date) async {
  http.Response response = await http.get(
      Uri.parse(sessionByDistrictApi + "district_id=$districtId&date=$date"));

  if (response.statusCode == 200) {
    Map sessionsData = jsonDecode(response.body);
    List<dynamic> data = sessionsData['sessions'];

    sessionByDistrict = data.map((json) => Session.fromJson(json)).toList();
    return sessionByDistrict;
  } else
    Exception(response.statusCode);
}
