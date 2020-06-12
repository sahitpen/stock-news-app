import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:stock_news/common/shared_preferences.dart';
import 'package:stock_news/screens/expanded_search_page.dart';
import 'package:stock_news/views/search_field.dart';

class AnimatedSearchField extends StatelessWidget {
  final Function onSubmitted;
  final TextEditingController controller;

  const AnimatedSearchField({
    Key key,
    this.onSubmitted,
    @required this.controller,
  })  : assert(controller != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: Duration(milliseconds: 500),
      tappable: false,
      openBuilder: (BuildContext context, VoidCallback action) {
        return FutureBuilder(
            future: _getFilterState(),
            builder: (_, AsyncSnapshot<Map<String, dynamic>> snapshot) {
              return ExpandedSearchPage(
                textEditingController: controller,
                filterStateMap: snapshot.data,
              );
            });
      },
      closedBuilder: (BuildContext c, VoidCallback action) {
        return SearchField(
          key: ValueKey('stock_search_field'),
          controller: controller,
          onSubmitted: onSubmitted,
          onTap: () => action(),
        );
      },
    );
  }

  Future<Map<String, dynamic>> _getFilterState() async {
    final _filterStateMap = await getFilters();
    return _filterStateMap;
  }
}
