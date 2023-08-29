import 'package:flutter/cupertino.dart';
import 'package:flutter_application/model/medicine.dart';

import '../model/medication.dart';

class MedicationProvider with ChangeNotifier{
  Medication _medication = Medication(null, "", "", 0, null, null, "", "", 0, null, "");

  void setMedicine(Medicine medicine){
    _medication.medicine = medicine;
    notifyListeners();
  }

  void setMedicineName(String name){
    _medication.medicineName = name;
    notifyListeners();
  }

  void setMedicineImage(String image){
    _medication.medicineImage = image;
    notifyListeners();
  }

  void setTakeCapacity(int capacity){
    _medication.takeCapacity = capacity;
    notifyListeners();
  }

  void setTakeStartdate(DateTime startDate){
    _medication.takeStartDate = startDate;
    notifyListeners();
  }

  void setTakeEndDate(DateTime endDate){
    _medication.takeEndDate = endDate;
    notifyListeners();
  }

  void setTakeMealTime(String mealTime){
    _medication.takeMealTime = mealTime;
    notifyListeners();
  }

  void setTakeBeforeAfter(String beforeAfter){
    _medication.takeBeforeAfter = beforeAfter;
    notifyListeners();
  }

  void setTakeCycle(int cycle){
    _medication.takeCycle = cycle;
    notifyListeners();
  }

  void setNotificationTime(DateTime notificationTime){
    _medication.notificationTime = notificationTime;
    notifyListeners();
  }

  void setDescritpion(String description){
    _medication.description = description;
    notifyListeners();
  }
}