import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_news/common/app_padding.dart';
import 'package:stock_news/common/app_theme.dart';
import 'package:stock_news/views/chip_filter.dart';
import 'package:stock_news/views/filter_display.dart';
import 'package:stock_news/views/search_field.dart';
import 'package:stock_news/views/slider_filter.dart';

class ExpandedSearchPage extends StatelessWidget {
  final TextEditingController textEditingController;

  ExpandedSearchPage({
    Key key,
    @required this.textEditingController,
  })  : assert(textEditingController != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> filterStateMap = {};
    final filterWidgetMap = {
      'News Type': ChipFilter.createRow(['Video', 'Audio'], filterStateMap),
      'Sentiment': ChipFilter.createRow(
          ['Positive', 'Negative', 'Neutral'], filterStateMap),
      'Number of Results': SliderFilter(),
    };
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
                  _popScreen(context, data: filterStateMap);
                },
              ),
              controller: textEditingController,
              onSubmitted: () => _popScreen(context, data: filterStateMap),
            ),
            SizedBox(height: 16.0),
            FilterDisplay.createColumn(filterWidgetMap),
          ],
        ),
      ),
    );
  }

  void _popScreen(BuildContext context, {Map<String, dynamic> data}) {
    _saveFilters(data);
    Navigator.pop(context, data);
  }

  // TODO: move Shared Preferences logic to separate class
  void _saveFilters(Map<String, dynamic> filterStateMap) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('news_type', filterStateMap['news_type']);
    await prefs.setString('sentiment', filterStateMap['sentiment']);
    await prefs.setInt('num_items', filterStateMap['num_items']);
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
