import 'package:flutter/material.dart';

class AppPadding {
  static const _defaultPadding = 8.0;
  static EdgeInsets padding({int factor = 1}) {
    return EdgeInsets.all(_defaultPadding * factor);
  }

  static EdgeInsets paddingTop({int factor = 1}) {
    return EdgeInsets.only(top: _defaultPadding * factor);
  }

  static EdgeInsets paddingHorizontal({int factor = 1}) {
    return EdgeInsets.symmetric(horizontal: _defaultPadding * factor);
  }

  static EdgeInsets paddingLeftTopRight({int factor = 1}) {
    final _padding = _defaultPadding * factor;
    return EdgeInsets.fromLTRB(_padding * 2, _padding * 6, _padding * 2, 0.0);
  }
}
