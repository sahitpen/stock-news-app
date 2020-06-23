import 'package:flutter/material.dart';
import 'package:stock_news/common/app_text.dart';

class HeaderTitles extends PreferredSize {
  HeaderTitles({
    Key key,
  }) : super(
          key: key,
          preferredSize: const Size.fromHeight(70.0),
          child: _makeHeaders(),
        );

  static Widget _makeHeaders() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Hey, Sahit.',
          style: AppText.headerLarge,
        ),
        Text(
          'Market Daily Digest.',
          style: AppText.appBar,
        ),
      ],
    );
  }
}
