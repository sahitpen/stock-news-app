import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:stock_news/common/common.dart';
import 'package:stock_news/screens/expanded_search_page.dart';
import 'package:stock_news/views/search_field.dart';

class AnimatedSearchField extends StatelessWidget {
  final Function _onSubmitted;
  final TextEditingController _controller;

  const AnimatedSearchField({
    Key key,
    Function onSubmitted,
    @required TextEditingController controller,
  })  : assert(controller != null),
        _onSubmitted = onSubmitted,
        _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: const Duration(milliseconds: 500),
      tappable: false,
      openBuilder: (BuildContext context, VoidCallback action) {
        return ExpandedSearchPage(
          textEditingController: _controller,
          filterStateMap: getFilters(),
        );
      },
      closedBuilder: (BuildContext c, VoidCallback action) {
        return SearchField(
          key: const ValueKey('stock_search_field'),
          controller: _controller,
          onSubmitted: _onSubmitted,
          onTap: () => action(),
        );
      },
      closedElevation: 0.0,
    );
  }
}
