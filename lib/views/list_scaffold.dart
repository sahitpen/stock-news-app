import 'package:flutter/material.dart';
import 'package:stock_news/common/app_padding.dart';
import 'package:stock_news/common/app_text.dart';
import 'package:stock_news/common/app_theme.dart';

class ListScaffold extends StatelessWidget {
  final String title;
  final List<Widget> widgets;
  final FloatingActionButton floatingActionButton;
  final bool isScrollable;

  const ListScaffold({
    Key key,
    this.title,
    this.widgets,
    this.floatingActionButton,
    this.isScrollable = true,
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
        title: Text(
          title,
          style: AppText.appBar,
        ),
      ),
      body: Padding(
        padding: AppPadding.padding16,
        child: isScrollable
            ? ListView(
                children: widgets,
              )
            : Column(
                children: widgets,
              ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
