import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_news/bloc/pricing_bloc.dart';
import 'package:stock_news/common/common.dart';
import 'package:stock_news/models/models.dart';
import 'package:stock_news/views/list_scaffold.dart';

class GraphPage extends StatelessWidget {
  final String _ticker;

  const GraphPage({
    Key key,
    @required String ticker,
  })  : assert(ticker != null),
        _ticker = ticker,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isSelected = [true, false, false];
    final _pricingBloc = BlocProvider.of<PricingBloc>(context);
    _pricingBloc.add(FetchPrices(ticker: _ticker));
    return Container(
      color: AppTheme.theme.canvasColor,
      child: SafeArea(
        child: ListScaffold(
          header: PreferredSize(
            child: Text(
              _ticker,
              style: AppText.appBar,
            ),
            preferredSize: const Size.fromHeight(20),
          ),
          widgets: <Widget>[
            StatefulBuilder(
              builder: (BuildContext context, _setState) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ToggleButtons(
                        children: const <Widget>[
                          Text('Year'),
                          Text('Month'),
                          Text('Week'),
                        ],
                        onPressed: (int index) {
                          _setState(() {
                            for (var buttonIndex = 0;
                                buttonIndex < _isSelected.length;
                                buttonIndex++) {
                              _isSelected[buttonIndex] = buttonIndex == index;
                            }
                          });
                        },
                        isSelected: _isSelected,
                      ),
                      const SizedBox(height: 32.0),
                      BlocBuilder<PricingBloc, PricingState>(
                        builder: (context, state) {
                          final _endDay = _getEndDay(_isSelected);
                          if (state is PricesLoaded) {
                            return LineChart(_chartData(
                              state.prices,
                              _endDay,
                            ));
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  int _getEndDay(List<bool> _toggleList) {
    if (_toggleList[0]) {
      return 365;
    } else if (_toggleList[1]) {
      return 30;
    } else if (_toggleList[2]) {
      return 7;
    }
    return null;
  }

  LineChartData _chartData(List<Price> prices, int _endDay) {
    final _priceEntries =
        prices.sublist(0, _endDay).reversed.toList().asMap().entries;
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
      minX: 0,
      maxX: _endDay * 1.0 - 1,
      minY: 0,
      lineBarsData: [
        LineChartBarData(
          spots: _priceEntries
              .map((price) => FlSpot(price.key.toDouble(), price.value.price))
              .toList(),
          isCurved: false,
          colors: AppTheme.chartGradients,
          barWidth: 3,
          isStrokeCapRound: false,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            colors: AppTheme.chartGradients
                .map((color) => color.withOpacity(0.3))
                .toList(),
          ),
        ),
      ],
    );
  }
}
