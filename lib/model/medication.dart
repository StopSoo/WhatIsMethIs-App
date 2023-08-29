import 'medicine.dart';

class Medication{
  Medicine? medicine;
  String? medicineName;
  String? medicineImage;
  int takeCapacity;
  DateTime? takeStartDate;
  DateTime? takeEndDate;
  String takeMealTime;
  String takeBeforeAfter;
  int takeCycle;
  DateTime? notificationTime;
  String? description;

  Medication(
    this.medicine,
    this.medicineName,
    this.medicineImage,
    this.takeCapacity,
    this.takeStartDate,
    this.takeEndDate,
    this.takeMealTime,
    this.takeBeforeAfter,
    this.takeCycle,
    this.notificationTime,
    this.description
  );
  
}