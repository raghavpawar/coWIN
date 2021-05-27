import 'package:flutter/foundation.dart';

class DistrictIdData extends ChangeNotifier {
  String recievedDistrictId;

  void initialize(String districtId) {
    recievedDistrictId = districtId;
    notifyListeners();
  }
}
