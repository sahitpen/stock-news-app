import 'package:flutter/material.dart';
import 'package:stock_news/common/common.dart';

class ListScaffold extends StatelessWidget {
  final Widget _icon;
  final Widget _header;
  final List<Widget> _widgets;

  const ListScaffold({
    Key key,
    Widget icon,
    Widget header,
    @required List<Widget> widgets,
  })  : assert(widgets != null),
        _icon = icon,
        _header = header,
        _widgets = widgets,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = AppTheme.theme;
    return Scaffold(
      body: Padding(
        padding: AppPadding.padding16Horizontal,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: AppTheme.theme.canvasColor,
                elevation: 0,
                leading: _icon,
                iconTheme: IconThemeData(
                  color: _theme.primaryColorDark,
                ),
                bottom: _header,
              ),
            ];
          },
          body: Padding(
            padding: AppPadding.paddingLeftTopRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _widgets,
            ),
          ),
        ),
      ),
    );
  }
}
