/*import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String sessionByDistrict =
    "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByDistrict?district_id=512&date=31-03-2021";

fetchDataBySessions() {
  http.Response response = http.get(Uri.parse(sessionByDistrict));
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
  StateName stateName;
  DistrictName districtName;
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
        stateName: stateNameValues.map[json["state_name"]],
        districtName: districtNameValues.map[json["district_name"]],
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
        "state_name": stateNameValues.reverse[stateName],
        "district_name": districtNameValues.reverse[districtName],
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

enum DistrictName { ALWAR }

final districtNameValues = EnumValues({"Alwar": DistrictName.ALWAR});

enum FeeType { FREE, PAID, EMPTY }

final feeTypeValues =
    EnumValues({"": FeeType.EMPTY, "Free": FeeType.FREE, "Paid": FeeType.PAID});

enum StateName { RAJASTHAN }

final stateNameValues = EnumValues({"Rajasthan": StateName.RAJASTHAN});

enum Vaccine { COVISHIELD }

final vaccineValues = EnumValues({"COVISHIELD": Vaccine.COVISHIELD});

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
*/
