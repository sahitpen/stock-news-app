import 'package:flutter/material.dart';
import 'package:stock_news/common/app_borders.dart';
import 'package:stock_news/common/app_padding.dart';
import 'package:stock_news/common/app_text.dart';
import 'package:stock_news/common/app_theme.dart';

class StockSearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function onSubmitted;

  const StockSearchField({
    ValueKey key,
    @required this.controller,
    this.onSubmitted,
  })  : assert(controller != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            key: ValueKey((key as ValueKey).value + '_text'),
            decoration: InputDecoration(
              hintText: 'Search for a ticker symbol',
              hintStyle: AppText.subtitle,
              contentPadding: AppPadding.padding8,
              border: OutlineInputBorder(borderRadius: AppBorders.rounded5),
            ),
            controller: controller,
            onSubmitted: (String value) => onSubmitted.call(),
          ),
        ),
        SizedBox(
          width: 5.0,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: AppBorders.rounded5,
            color: AppTheme.theme.accentColor,
          ),
          child: IconButton(
            padding: AppPadding.padding8,
            icon: Icon(
              Icons.search,
              color: AppTheme.theme.canvasColor,
            ),
            onPressed: onSubmitted,
          ),
        )
      ],
    );
  }
}
