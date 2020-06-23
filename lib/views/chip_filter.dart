import 'package:flutter/material.dart';

class ChipFilter extends StatelessWidget {
  final String _label;
  final Map<String, dynamic> _stateMap;

  const ChipFilter({
    Key key,
    @required String label,
    @required Map<String, dynamic> stateMap,
  })  : assert(
          label != null,
          stateMap != null,
        ),
        _label = label,
        _stateMap = stateMap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _lowercaseLabel = _label.toLowerCase();
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter _setState) {
      return FilterChip(
        selected: _stateMap[_lowercaseLabel],
        onSelected: (bool value) {
          _setState(() => _stateMap[_lowercaseLabel] = value);
        },
        label: Text(_label),
      );
    });
  }

  static Row createRow(
      {Key key, List<String> labels, Map<String, dynamic> stateMap}) {
    final _chipFilterList = labels
        .map((label) => ChipFilter(
              key: key,
              label: label,
              stateMap: stateMap,
            ))
        .toList();
    return Row(children: _chipFilterList);
  }
}
