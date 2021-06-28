import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:cowin_portal/constants.dart';

// String date = DateFormat("dd-MM-yyyy").format(DateTime.now());

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

class Session {
  Session({
    this.centerId,
    this.name,
    this.address,
    this.stateName,
    this.districtName,
    this.blockName,
    this.pincode,
    this.from,
    this.to,
    this.lat,
    this.long,
    this.feeType,
    this.sessionId,
    this.date,
    this.availableCapacityDose1,
    this.availableCapacityDose2,
    this.availableCapacity,
    this.fee,
    this.minAgeLimit,
    this.vaccine,
    this.slots,
  });

  int centerId;
  String name;
  String address;
  String stateName;
  String districtName;
  String blockName;
  int pincode;
  String from;
  String to;
  double lat;
  double long;
  FeeType feeType;
  String sessionId;
  Date date;
  int availableCapacityDose1;
  int availableCapacityDose2;
  int availableCapacity;
  String fee;
  int minAgeLimit;
  Vaccine vaccine;
  List<String> slots;

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        centerId: json["center_id"],
        name: json["name"],
        address: json["address"],
        stateName: json["state_name"],
        districtName: json["district_name"],
        blockName: json["block_name"],
        pincode: json["pincode"],
        from: json["from"],
        to: json["to"],
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
        feeType: feeTypeValues.map[json["fee_type"]],
        sessionId: json["session_id"],
        date: dateValues.map[json["date"]],
        availableCapacityDose1: json["available_capacity_dose1"],
        availableCapacityDose2: json["available_capacity_dose2"],
        availableCapacity: json["available_capacity"],
        fee: json["fee"],
        minAgeLimit: json["min_age_limit"],
        vaccine: vaccineValues.map[json["vaccine"]],
        slots: List<String>.from(json["slots"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "center_id": centerId,
        "name": name,
        "address": address,
        "state_name": stateName,
        "district_name": districtName,
        "block_name": blockName,
        "pincode": pincode,
        "from": from,
        "to": to,
        "lat": lat,
        "long": long,
        "fee_type": feeTypeValues.reverse[feeType],
        "session_id": sessionId,
        "date": dateValues.reverse[date],
        "available_capacity_dose1": availableCapacityDose1,
        "available_capacity_dose2": availableCapacityDose2,
        "available_capacity": availableCapacity,
        "fee": fee,
        "min_age_limit": minAgeLimit,
        "vaccine": vaccineValues.reverse[vaccine],
        "slots": List<dynamic>.from(slots.map((x) => x)),
      };
}

enum Date { THE_31032021 }

final dateValues = EnumValues({"31-03-2021": Date.THE_31032021});

enum FeeType { FREE, PAID }

final feeTypeValues = EnumValues({"Free": FeeType.FREE, "Paid": FeeType.PAID});

enum Vaccine { COVISHIELD, COVAXIN }

final vaccineValues =
    EnumValues({"COVISHIELD": Vaccine.COVISHIELD, "COVAXIN": Vaccine.COVAXIN});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
