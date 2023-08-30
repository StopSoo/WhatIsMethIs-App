import 'package:flutter/cupertino.dart';
import 'package:flutter_application/model/medicine.dart';

class MedicineProvider with ChangeNotifier{
  Medicine _medicine = Medicine("", "", "", "", "", "", "", "", "", "", "", "", "", "");

  Medicine get medicine => _medicine;

  void setMedicine(Medicine medicine){
    _medicine = medicine;
    notifyListeners();
  }
}