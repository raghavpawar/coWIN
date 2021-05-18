import 'package:http/http.dart' as http;

import 'dart:convert';

class IndiaStates {
  IndiaStates({
    this.stateId,
    this.stateName,
  });

  int stateId;
  String stateName;

  factory IndiaStates.fromJson(Map<String, dynamic> json) => IndiaStates(
        stateId: json["state_id"],
        stateName: json["state_name"],
      );

  Map<String, dynamic> toJson() => {
        "state_id": stateId,
        "state_name": stateName,
      };
}
