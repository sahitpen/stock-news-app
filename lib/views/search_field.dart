import 'package:flutter/material.dart';
import 'package:stock_news/common/app_borders.dart';
import 'package:stock_news/common/app_padding.dart';
import 'package:stock_news/common/app_text.dart';
import 'package:stock_news/common/app_theme.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function onSubmitted;
  final Function onTap;
  final Widget prefixIcon;
  static final _theme = AppTheme.theme;

  const SearchField({
    ValueKey key,
    this.onSubmitted,
    this.onTap,
    this.prefixIcon,
    @required this.controller,
  })  : assert(controller != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
              border: OutlineInputBorder(borderRadius: AppBorders.rounded5),
            ),
            onTap: onTap,
            onSubmitted: (String value) => onSubmitted.call(),
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: AppBorders.rounded5,
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
        )
      ],
    );
  }
}