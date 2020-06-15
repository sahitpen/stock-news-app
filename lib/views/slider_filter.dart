import 'package:flutter/material.dart';
import 'package:stock_news/common/app_theme.dart';

class SliderFilter extends StatelessWidget {
  static final _theme = AppTheme.theme;
  final Map<String, dynamic> stateMap;

  const SliderFilter({
    Key key,
    @required this.stateMap,
  })  : assert(stateMap != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        final sliderValue = stateMap['num_results'] ?? 0.0;
        return Slider(
          value: sliderValue,
          onChanged: (newValue) =>
              setState(() => stateMap['num_results'] = newValue),
          divisions: 5,
          label: '${sliderValue}',
          min: 0,
          max: 50,
          inactiveColor: _theme.accentColor,
          activeColor: _theme.primaryColor,
        );
      },
    );
  }
}
