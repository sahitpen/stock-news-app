import 'package:flutter/material.dart';
import 'package:stock_news/common/app_padding.dart';
import 'package:stock_news/common/app_theme.dart';

class ListScaffold extends StatelessWidget {
  final Widget icon;
  final List<Widget> widgets;
  final bool implyLeading;
  static final _theme = AppTheme.theme;

  const ListScaffold({
    Key key,
    this.icon,
    this.implyLeading = true,
    @required this.widgets,
  })  : assert(widgets != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _theme.canvasColor,
      appBar: AppBar(
        automaticallyImplyLeading: implyLeading,
        elevation: 0,
        backgroundColor: _theme.canvasColor,
        iconTheme: IconThemeData(
          color: _theme.primaryColorDark,
        ),
        leading: icon,
      ),
      body: Padding(
        padding: AppPadding.padding16Horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widgets,
        ),
      ),
    );
  }
}
