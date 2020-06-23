import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_news/bloc/pricing_bloc.dart';
import 'package:stock_news/common/common.dart';
import 'package:stock_news/views/list_scaffold.dart';

class GraphPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pricingBloc = BlocProvider.of<PricingBloc>(context);
    return Container(
      color: AppTheme.theme.canvasColor,
      child: SafeArea(
        child: ListScaffold(
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
              onPressed: () =>
                  pricingBloc.add(const FetchPrices(ticker: 'IBM')),
            ),
          ],
        ),
      ),
    );
  }
}
