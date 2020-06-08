import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppText {
  static const appBar = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 30,
  );
  static const header = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w300,
    fontSize: 16.0,
  );
  static final headerLarge = header.copyWith(fontSize: 30);
  static const subtitle = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
  );
  static final subtitleAccent =
      subtitle.copyWith(color: AppTheme.theme.accentColor);
  static final subtitleDark = subtitle.copyWith(color: Colors.black);
}
