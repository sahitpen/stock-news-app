import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_news/common/app_padding.dart';
import 'package:stock_news/common/app_theme.dart';
import 'package:stock_news/models/filters.dart';
import 'package:stock_news/views/filter_display.dart';
import 'package:stock_news/views/search_field.dart';

class ExpandedSearchPage extends StatelessWidget {
  final TextEditingController textEditingController;

  const ExpandedSearchPage({
    Key key,
    @required this.textEditingController,
  })  : assert(textEditingController != null),
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
                  textEditingController.clear();
                  _popScreen(context);
                },
              ),
              controller: textEditingController,
              onSubmitted: () => _popScreen(context),
            ),
            SizedBox(height: 16.0),
            FilterDisplay.createColumn(Filters.filterMap),
          ],
        ),
      ),
    );
  }

  void _popScreen(BuildContext context) {
    //_saveFilters();
    Navigator.pop(context);
  }

  // TO-DO: move Shared Preferences logic to separate class
  void _saveFilters(Map<String, dynamic> filterOptions) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('news_type', filterOptions['news_type']);
    await prefs.setString('sentiment', filterOptions['sentiment']);
    await prefs.setInt('num_items', filterOptions['num_items']);
  }

  Future<Map<String, dynamic>> _getFilters() async {
    final filterOptions = <String, dynamic>{};
    final prefs = await SharedPreferences.getInstance();
    filterOptions['news_type'] = await prefs.getString('news_type');
    filterOptions['sentiment'] = await prefs.getString('sentiment');
    filterOptions['num_items'] = await prefs.getInt('num_items') ?? 50;
    return filterOptions;
  }
}
