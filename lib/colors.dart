import 'package:flutter/material.dart';

itemColor(index) {
  final cardcolors = [
    Colors.amber.shade300,
    Colors.blue.shade300,
    Colors.teal.shade300,
    Colors.deepOrange.shade300,
    Colors.deepPurple.shade300,
    Colors.green.shade300,
  ];
  return cardcolors[index % cardcolors.length];
}
