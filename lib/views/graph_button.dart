import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_news/bloc/pricing_bloc.dart';
import 'package:stock_news/common/app_text.dart';
import 'package:stock_news/common/app_theme.dart';
import 'package:stock_news/repositories/pricing_api_client.dart';
import 'package:stock_news/screens/graph_page.dart';

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
          onTap: () => _openGraphPage(context),
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

  void _openGraphPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => BlocProvider(
          create: (context) => PricingBloc(
            apiClient: PricingApiClient(
              httpClient: Dio(),
            ),
          ),
          child: GraphPage(),
        ),
      ),
    );
  }
}
