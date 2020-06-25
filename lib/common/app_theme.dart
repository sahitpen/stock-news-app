import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    fontFamily: 'OpenSans',
    accentColor: Colors.indigo,
    primaryColor: const Color.fromRGBO(6, 5, 24, 1),
    primaryColorDark: Colors.black,
    cardColor: Colors.grey[100],
    canvasColor: Colors.white,
    highlightColor: Colors.blueGrey,
  );
  static final chartGradients = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];
}
