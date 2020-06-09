import 'package:flutter/material.dart';
import 'package:stock_news/common/app_padding.dart';
import 'package:stock_news/common/app_theme.dart';

class ListScaffold extends StatelessWidget {
  final Widget icon;
  final Widget header;
  final List<Widget> widgets;
  static final _theme = AppTheme.theme;

  const ListScaffold({
    Key key,
    this.icon,
    this.header,
    @required this.widgets,
  })  : assert(widgets != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _theme.canvasColor,
      body: Padding(
        padding: AppPadding.padding16Horizontal,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 0,
                backgroundColor: _theme.canvasColor,
                leading: icon,
                iconTheme: IconThemeData(
                  color: _theme.primaryColorDark,
                ),
                bottom: header,
              ),
            ];
          },
          body: Padding(
            padding: AppPadding.paddingLeftTopRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widgets,
            ),
          ),
        ),
      ),
    );
  }
}
