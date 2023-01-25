import 'package:flutter/material.dart';

itemColor(fs) {
  int r = 255;
  int g = 0;
  int b = 0;
  double a = 100;
  if (fs.toString().isNotEmpty){
    r = int.parse(fs)*255~/100 ;
    g = 255 - r;
    //a=double.parse(fs);
  }
  return Color.fromRGBO(r, g, b, a);
}
