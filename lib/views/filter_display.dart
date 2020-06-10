import 'package:flutter/material.dart';
import 'package:stock_news/common/app_text.dart';

class FilterDisplay extends StatelessWidget {
  final String title;
  final Widget filter;

  const FilterDisplay({
    Key key,
    @required this.title,
    @required this.filter,
  })  : assert(
          title != null,
          filter != null,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: AppText.subtitle,
        ),
        filter,
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
