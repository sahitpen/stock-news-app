import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_news/bloc/pricing_bloc.dart';
import 'package:stock_news/common/common.dart';
import 'package:stock_news/views/line_chart_data.dart';
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
          header: _GraphHeader(ticker: _ticker),
          widgets: <Widget>[_GraphView(isSelected: _isSelected)],
        ),
      ),
    );
  }
}

class _GraphView extends StatelessWidget {
  const _GraphView({
    Key key,
    @required List<bool> isSelected,
  })  : _isSelected = isSelected,
        super(key: key);

  final List<bool> _isSelected;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
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
              _Chart(isSelected: _isSelected),
            ],
          ),
        );
      },
    );
  }
}

class _Chart extends StatelessWidget {
  const _Chart({
    Key key,
    @required List<bool> isSelected,
  })  : _isSelected = isSelected,
        super(key: key);

  final List<bool> _isSelected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PricingBloc, PricingState>(
      builder: (context, state) {
        final _endDay = _getEndDay(_isSelected);
        if (state is PricesLoaded) {
          return LineChart(
            chartData(
              state.prices,
              _endDay,
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
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
}

class _GraphHeader extends PreferredSize {
  _GraphHeader({
    Key key,
    @required String ticker,
  }) : super(
          key: key,
          child: Text(
            ticker,
            style: AppText.appBar,
          ),
          preferredSize: const Size.fromHeight(20),
        );
}
