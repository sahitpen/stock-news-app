import 'package:flutter/material.dart';

class ChipFilter extends StatelessWidget {
  final String label;
  final Map<String, dynamic> stateMap;

  const ChipFilter({
    Key key,
    @required this.label,
    @required this.stateMap,
  })  : assert(
          label != null,
          stateMap != null,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _lowercaseLabel = label.toLowerCase();
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter _setState) {
      return FilterChip(
        selected: stateMap[_lowercaseLabel],
        onSelected: (bool value) {
          _setState(() => stateMap[_lowercaseLabel] = value);
        },
        label: Text(label),
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
