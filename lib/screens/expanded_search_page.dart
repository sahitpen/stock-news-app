import 'package:flutter/material.dart';
import 'package:stock_news/common/common.dart';
import 'package:stock_news/views/chip_filter.dart';
import 'package:stock_news/views/filter_display.dart';
import 'package:stock_news/views/search_field.dart';
import 'package:stock_news/views/slider_filter.dart';

class ExpandedSearchPage extends StatelessWidget {
  final TextEditingController _textEditingController;
  final Map<String, dynamic> _filterStateMap;

  const ExpandedSearchPage({
    Key key,
    @required TextEditingController textEditingController,
    @required Map<String, dynamic> filterStateMap,
  })  : assert(
          textEditingController != null,
          filterStateMap != null,
        ),
        _textEditingController = textEditingController,
        _filterStateMap = filterStateMap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.paddingLeftTopRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SearchField(
                key: const ValueKey('stock_search_field'),
                isGraphButtonVisible: false,
                prefixIcon: InkWell(
                  child: Icon(
                    Icons.arrow_back,
                    color: AppTheme.theme.highlightColor,
                  ),
                  onTap: () {
                    _textEditingController.clear();
                    _popScreen(
                      context,
                      data: _filterStateMap,
                    );
                  },
                ),
                controller: _textEditingController,
                onSubmitted: () => _popScreen(
                  context,
                  data: _filterStateMap,
                ),
              ),
              const SizedBox(height: 16.0),
              FilterDisplay.createColumn(_getFilterWidgets()),
            ],
          ),
        ),
      ),
    );
  }

  void _popScreen(BuildContext context, {Map<String, dynamic> data}) async {
    await saveFilters(data);
    Navigator.pop(context, data);
  }

  Map<String, Widget> _getFilterWidgets() {
    final _filterWidgetMap = <String, Widget>{};
    for (final label in FilterLabels.boolLabels.keys) {
      _filterWidgetMap[label] = ChipFilter.createRow(
        labels: FilterLabels.boolLabels[label],
        stateMap: _filterStateMap,
      );
    }
    _filterWidgetMap['Number of Results'] =
        SliderFilter(stateMap: _filterStateMap);
    return _filterWidgetMap;
  }
}
