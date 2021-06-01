import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class DistrictIdData extends ChangeNotifier {
  String recievedDistrictId;
  String recievedPincode;
  String newDate = DateFormat("dd-MM-yyyy").format(DateTime.now());
  int age;
  String vaccine;
  String price;
  int counter = 0;
  int ageCounter = 0;
  int vaccineCounter = 0;
  int priceCounter = 0;
  bool isButtonEnabled = false;
  String myState;
  String myCity;

  void initializeState(String newValue) {
    if (newValue != null) {
      this.myState = newValue;
    }
    notifyListeners();
  }

  void intializeCity(String newValue) {
    if (newValue != null) {
      this.myCity = newValue;
    }
    notifyListeners();
  }

  void nullifyState() {
    this.myState = null;
  }

  void nullifyCity() {
    this.myCity = null;
  }

  void disableButton() {
    isButtonEnabled = false;
    notifyListeners();
  }

  void toggleButton() {
    isButtonEnabled = true;
    notifyListeners();
  }

  void initializeDistrictId(String districtId) {
    recievedDistrictId = districtId;
    notifyListeners();
  }

  void initializePincode(String pincode) {
    recievedPincode = pincode;
  }

  void changeDate(String date) {
    newDate = date;
    notifyListeners();
  }

  void applyAgeFilter(String age) {
    this.age = int.parse(age.substring(0, 2));
    notifyListeners();
  }

  void applyVaccineFilter(String vaccine) {
    this.vaccine = vaccine.toUpperCase();
    notifyListeners();
  }

  void applyPriceFilter(String price) {
    this.price = price.toUpperCase();
    notifyListeners();
  }

  void increaseCounter() {
    ++this.counter;
    notifyListeners();
  }

  void increaseAgeCounter() {
    ++this.ageCounter;
    notifyListeners();
  }

  void increaseVaccineCounter() {
    ++this.vaccineCounter;
    notifyListeners();
  }

  void increasePriceCounter() {
    ++this.priceCounter;
    notifyListeners();
  }

  void nullifyAge() {
    this.age = null;
    --this.counter;
    --this.ageCounter;
    notifyListeners();
  }

  void nullifyVaccine() {
    this.vaccine = null;
    --this.counter;
    --this.vaccineCounter;
    notifyListeners();
  }

  void nullifyPrice() {
    this.price = null;
    --this.counter;
    --this.priceCounter;
    notifyListeners();
  }

  void nullifyCounters() {
    this.counter = 0;
    this.ageCounter = 0;
    this.vaccineCounter = 0;
    this.priceCounter = 0;
    notifyListeners();
  }
}
