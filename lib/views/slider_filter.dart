import 'package:flutter/material.dart';
import 'package:stock_news/common/app_theme.dart';

class SliderFilter extends StatelessWidget {
  static final _theme = AppTheme.theme;

  const SliderFilter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _slideValue = 0.0;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Slider(
          value: _slideValue,
          onChanged: (newValue) => setState(() => _slideValue = newValue),
          divisions: 5,
          label: '$_slideValue',
          min: 0,
          max: 50,
          inactiveColor: _theme.accentColor,
          activeColor: _theme.primaryColor,
        );
      },
    );
  }
}
