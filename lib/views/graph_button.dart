import 'package:flutter/material.dart';
import 'package:stock_news/common/app_text.dart';
import 'package:stock_news/common/app_theme.dart';

class GraphButton extends StatelessWidget {
  final bool visible;
  final TextEditingController controller;

  const GraphButton({
    Key key,
    @required this.visible,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      child: Visibility(
        visible: visible ?? controller.text != '',
        child: InkWell(
          onTap: () {},
          child: Row(
            children: <Widget>[
              Text(
                controller.text,
                style: AppText.subtitle,
              ),
              Icon(
                Icons.arrow_forward,
                size: 20.0,
                color: AppTheme.theme.accentColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
