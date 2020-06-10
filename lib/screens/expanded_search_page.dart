import 'package:flutter/material.dart';
import 'package:stock_news/common/app_padding.dart';
import 'package:stock_news/common/app_theme.dart';
import 'package:stock_news/models/filters.dart';
import 'package:stock_news/views/filter_display.dart';
import 'package:stock_news/views/search_field.dart';

class ExpandedSearchPage extends StatelessWidget {
  final TextEditingController controller;

  const ExpandedSearchPage({
    Key key,
    @required this.controller,
  })  : assert(controller != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPadding.paddingLeftTopRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SearchField(
              key: ValueKey('stock_search_field'),
              prefixIcon: InkWell(
                child: Icon(
                  Icons.arrow_back,
                  color: AppTheme.theme.highlightColor,
                ),
                onTap: () {
                  controller.clear();
                  _popScreen(context);
                },
              ),
              controller: controller,
              onSubmitted: () => _popScreen(context),
            ),
            SizedBox(height: 16.0),
            FilterDisplay.createColumn(Filters.filterMap)
          ],
        ),
      ),
    );
  }

  void _popScreen(BuildContext context) {
    Navigator.pop(context);
  }
}
