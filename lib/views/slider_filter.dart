import 'package:flutter/material.dart';
import 'package:stock_news/common/app_theme.dart';

class SliderFilter extends StatelessWidget {
  final Map<String, dynamic> _stateMap;

  const SliderFilter({
    Key key,
    @required Map<String, dynamic> stateMap,
  })  : assert(stateMap != null),
        _stateMap = stateMap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = AppTheme.theme;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter _setState) {
        final sliderValue = _stateMap['num_results'];
        return Slider(
          value: sliderValue,
          onChanged: (newValue) =>
              _setState(() => _stateMap['num_results'] = newValue),
          divisions: 9,
          label: '${sliderValue}',
          min: 5,
          max: 50,
          inactiveColor: _theme.accentColor,
          activeColor: _theme.primaryColor,
        );
      },
    );
  }
}
