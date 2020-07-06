import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stock_news/common/common.dart';
import 'package:stock_news/models/models.dart';

LineChartData chartData(List<Price> prices, int _endDay) {
  final _priceEntries =
      prices.sublist(0, _endDay).reversed.toList().asMap().entries;
  return LineChartData(
      minY: 0,
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
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: false,
        ),
      ));
}
