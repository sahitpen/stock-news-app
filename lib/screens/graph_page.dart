import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_news/bloc/pricing_bloc.dart';
import 'package:stock_news/common/app_text.dart';
import 'package:stock_news/common/app_theme.dart';
import 'package:stock_news/views/list_scaffold.dart';

class GraphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pricingBloc = BlocProvider.of<PricingBloc>(context);
    return ListScaffold(
      widgets: <Widget>[
        BlocBuilder<PricingBloc, PricingState>(
          builder: (context, prices) {
            return Text(prices.toString());
          },
        ),
        FlatButton(
          color: AppTheme.theme.accentColor,
          child: Text(
            'Fetch Prices',
            style: AppText.subtitle,
          ),
          onPressed: () => pricingBloc.add(FetchPrices(ticker: 'IBM')),
        ),
      ],
    );
  }
}
