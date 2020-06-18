import 'package:flutter/material.dart';
import 'package:stock_news/common/app_borders.dart';
import 'package:stock_news/common/app_padding.dart';
import 'package:stock_news/common/app_text.dart';
import 'package:stock_news/common/app_theme.dart';
import 'package:stock_news/views/graph_button.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function onSubmitted;
  final Function onTap;
  final Widget prefixIcon;
  final bool isGraphButtonVisible;
  static final _theme = AppTheme.theme;

  const SearchField({
    ValueKey key,
    this.onSubmitted,
    this.onTap,
    this.prefixIcon,
    this.isGraphButtonVisible,
    @required this.controller,
  })  : assert(controller != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                key: ValueKey((key as ValueKey).value + '_text'),
                controller: controller,
                decoration: InputDecoration(
                  prefixIcon: prefixIcon,
                  hintText: 'Search for a ticker symbol',
                  hintStyle: AppText.subtitle,
                  contentPadding: AppPadding.padding8,
                  border:
                      OutlineInputBorder(borderRadius: AppBorders.rounded5Left),
                ),
                onTap: onTap,
                onSubmitted: (String value) => onSubmitted.call(),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: AppBorders.rounded5Right,
                color: _theme.accentColor,
              ),
              child: IconButton(
                padding: AppPadding.padding8,
                icon: Icon(
                  Icons.search,
                  color: _theme.canvasColor,
                ),
                onPressed: onSubmitted,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.0),
        GraphButton(
          visible: isGraphButtonVisible,
          controller: controller,
        ),
      ],
    );
  }
}
