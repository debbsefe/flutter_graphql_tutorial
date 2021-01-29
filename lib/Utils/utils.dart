import 'package:flutter/material.dart';

Color colorSwitch(String country) {
  switch (country) {
    case 'Africa':
      return Color(0xffFAAA19);
    case 'Antarctica':
      return Color(0xff8BBBD9);
    case 'Asia':
      return Color(0xffF20544);
    case 'Europe':
      return Color(0xff14408A);
    case 'North America':
      return Color(0xff93BFB7);
    case 'Oceania':
      return Color(0xff238C6E);
    case 'South America':
      return Color(0xffF28729);
    default:
      return Color(0xffFAAA19);
  }
}

Color colortextSwitch(String country) {
  switch (country) {
    case 'Africa':
      return Colors.black;
    case 'Antarctica':
      return Colors.white;
    case 'Asia':
      return Colors.white;
    case 'Europe':
      return Colors.white;
    case 'North America':
      return Colors.white;
    case 'Oceania':
      return Colors.white;
    case 'South America':
      return Colors.white;
    default:
      return Colors.white;
  }
}
