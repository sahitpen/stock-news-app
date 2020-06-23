import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_news/bloc/pricing_bloc.dart';
import 'package:stock_news/common/common.dart';
import 'package:stock_news/repositories/repositories.dart';
import 'package:stock_news/screens/graph_page.dart';

class GraphButton extends StatelessWidget {
  final bool _visible;
  final TextEditingController _controller;

  const GraphButton({
    Key key,
    bool visible,
    @required TextEditingController controller,
  })  : assert(controller != null),
        _visible = visible,
        _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      child: Visibility(
        visible: _visible ?? _controller.text != '',
        child: InkWell(
          onTap: () => _openGraphPage(context),
          child: Row(
            children: <Widget>[
              Text(
                _controller.text,
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
