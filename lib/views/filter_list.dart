import 'package:flutter/material.dart';
import 'package:stock_news/common/app_text.dart';

class FilterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> _filters = [];
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: <Widget>[
            Text(
              'News Type',
              style: AppText.subtitle,
            ),
            FilterChip(
              selected: _filters.contains('Video'),
              onSelected: (bool value) {
                setState(() {
                  if (value) {
                    _filters.add('Video');
                  } else {
                    _filters.removeWhere((String type) => type == 'Video');
                  }
                });
              },
              label: Text('Video'),
            ),
          ],
        );
      },
    );
  }
}
