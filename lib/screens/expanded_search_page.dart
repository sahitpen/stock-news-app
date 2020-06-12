import 'package:flutter/material.dart';
import 'package:stock_news/common/app_padding.dart';
import 'package:stock_news/common/app_theme.dart';
import 'package:stock_news/common/filter_labels.dart';
import 'package:stock_news/common/shared_preferences.dart';
import 'package:stock_news/views/chip_filter.dart';
import 'package:stock_news/views/filter_display.dart';
import 'package:stock_news/views/search_field.dart';
import 'package:stock_news/views/slider_filter.dart';

class ExpandedSearchPage extends StatelessWidget {
  final TextEditingController textEditingController;
  final Map<String, dynamic> filterStateMap;

  const ExpandedSearchPage({
    Key key,
    @required this.textEditingController,
    @required this.filterStateMap,
  })  : assert(
          textEditingController != null,
          filterStateMap != null,
        ),
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
                  _popScreen(
                    context,
                    data: filterStateMap,
                  );
                },
              ),
              controller: textEditingController,
              onSubmitted: () => _popScreen(
                context,
                data: filterStateMap,
              ),
            ),
            const SizedBox(height: 16.0),
            FilterDisplay.createColumn(_getFilterWidgets()),
          ],
        ),
      ),
    );
  }

  void _popScreen(BuildContext context, {Map<String, dynamic> data}) async {
    await saveFilters(data);
    Navigator.pop(context, data);
  }

  Map<String, Widget> _getFilterWidgets() {
    Map<String, Widget> _filterWidgetMap = {};
    for (final label in FilterLabels.boolLabels.keys) {
      _filterWidgetMap[label] = ChipFilter.createRow(
        labels: FilterLabels.boolLabels[label],
        stateMap: filterStateMap,
      );
    }
    _filterWidgetMap['Number of Results'] = SliderFilter();
    return _filterWidgetMap;
  }
}
