import 'package:flutter/material.dart';
import 'package:stock_news/common/app_padding.dart';
import 'package:stock_news/common/app_theme.dart';

class ListScaffold extends StatelessWidget {
  final Icon icon;
  final List<Widget> widgets;
  final FloatingActionButton floatingActionButton;

  const ListScaffold({
    Key key,
    this.icon,
    this.widgets,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.theme.canvasColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.theme.canvasColor,
        iconTheme: IconThemeData(
          color: AppTheme.theme.primaryColorDark,
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
      floatingActionButton: floatingActionButton,
    );
  }
}
