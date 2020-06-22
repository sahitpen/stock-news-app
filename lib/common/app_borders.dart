import 'package:flutter/material.dart';

class AppBorders {
  static final rounded5 = BorderRadius.circular(5.0);
  static const rounded5Left = BorderRadius.only(
    bottomLeft: Radius.circular(5.0),
    topLeft: Radius.circular(5.0),
  );
  static const rounded5Right = BorderRadius.only(
    bottomRight: Radius.circular(5.0),
    topRight: Radius.circular(5.0),
  );
  static final rounded20 = BorderRadius.circular(20.0);
}
