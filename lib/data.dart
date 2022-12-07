import 'package:flutter/material.dart';

/*
Class 'Data' defines the structure of each entry in the Data History

Each entry will contain three things:
1. The Weight in Entry (int)
2. The Date of Entry (DateTime)
3. The Time of Entry (TimeOfDay) 
*/

class Data {
  double weight;
  DateTime date;
  TimeOfDay time;

  Data(this.weight, this.date, this.time);
}
