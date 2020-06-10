import 'package:flutter/material.dart';

class ChipFilter extends StatelessWidget {
  final String label;

  const ChipFilter({
    Key key,
    @required this.label,
  })  : assert(label != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var _isSelected = false;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return FilterChip(
        selected: _isSelected,
        onSelected: (bool value) {
          setState(() => _isSelected = value);
        },
        label: Text(label),
      );
    });
  }

  static Row createRow(List<String> labels) {
    final _chipFilterList =
        labels.map((label) => ChipFilter(label: label)).toList();
    return Row(children: _chipFilterList);
  }
}
