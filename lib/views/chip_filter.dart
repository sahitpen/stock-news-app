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
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return FilterChip(
        selected: stateMap[label] ?? false,
        onSelected: (bool value) {
          setState(() => stateMap[label] = value);
        },
        label: Text(label),
      );
    });
  }

  static Row createRow(List<String> labels, Map<String, dynamic> stateMap) {
    final _chipFilterList = labels
        .map((label) => ChipFilter(
              label: label,
              stateMap: stateMap,
            ))
        .toList();
    return Row(children: _chipFilterList);
  }
}
