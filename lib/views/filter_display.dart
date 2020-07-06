import 'package:flutter/material.dart';
import 'package:stock_news/common/common.dart';

class FilterDisplay extends StatelessWidget {
  final String _title;
  final Widget _filter;

  const FilterDisplay({
    Key key,
    @required String title,
    @required Widget filter,
  })  : assert(title != null),
        assert(filter != null),
        _title = title,
        _filter = filter,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          _title,
          style: AppText.subtitle,
        ),
        _filter,
      ],
    );
  }

  static Column createColumn(Map<String, Widget> filterMap) {
    final _filterDisplayList = filterMap.keys
        .map(
          (title) => FilterDisplay(
            title: title,
            filter: filterMap[title],
          ),
        )
        .toList();
    return Column(children: _filterDisplayList);
  }
}
