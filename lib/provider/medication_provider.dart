import 'package:flutter/cupertino.dart';
import 'package:flutter_application/model/medicine.dart';

import '../model/medication.dart';

class MedicationProvider with ChangeNotifier{
  Medication _medication = Medication("", "", 0, "", "", "", "", 0, "", "");

  Medication get medication => _medication;

  void setMedication(Medication medication){
    _medication = medication;
    notifyListeners();
  }

}