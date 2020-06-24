import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_news/bloc/pricing_bloc.dart';
import 'package:stock_news/common/common.dart';
import 'package:stock_news/models/models.dart';
import 'package:stock_news/views/list_scaffold.dart';

class GraphPage extends StatelessWidget {
  final String _ticker;
  final List<Color> _gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  GraphPage({
    Key key,
    @required String ticker,
  })  : assert(ticker != null),
        _ticker = ticker,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final pricingBloc = BlocProvider.of<PricingBloc>(context);
    pricingBloc.add(FetchPrices(ticker: _ticker));
    return Container(
      color: AppTheme.theme.canvasColor,
      child: SafeArea(
        child: ListScaffold(
          header: PreferredSize(
            child: Text(
              _ticker,
              style: AppText.appBar,
            ),
            preferredSize: const Size.fromHeight(10),
          ),
          widgets: <Widget>[
            BlocBuilder<PricingBloc, PricingState>(
              builder: (context, state) {
                if (state is PricesLoaded) {
                  print(state.prices);
                  return LineChart(chartData(state.prices));
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  LineChartData chartData(List<Price> prices) {
    final _priceEntries =
        prices.sublist(0, 52).reversed.toList().asMap().entries;
    return LineChartData(
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: false,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      minX: 1,
      maxX: 52,
      minY: 0,
      lineBarsData: [
        LineChartBarData(
          spots: _priceEntries
              .map((price) => FlSpot(price.key.toDouble(), price.value.price))
              .toList(),
          isCurved: false,
          colors: _gradientColors,
          barWidth: 3,
          isStrokeCapRound: false,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            colors:
                _gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
