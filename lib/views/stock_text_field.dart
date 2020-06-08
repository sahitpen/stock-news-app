import 'package:flutter/material.dart';
import 'package:stock_news/common/app_borders.dart';
import 'package:stock_news/common/app_padding.dart';

class StockTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function onSubmitted;

  const StockTextField({
    ValueKey key,
    @required this.controller,
    this.onSubmitted,
  })  : assert(controller != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: ValueKey((key as ValueKey).value + '_text'),
      decoration: InputDecoration(
        hintText: 'Search for a ticker symbol.',
        contentPadding: AppPadding.padding16,
        border: OutlineInputBorder(borderRadius: AppBorders.rounded),
        prefixIcon: Icon(Icons.search),
      ),
      controller: controller,
      onSubmitted: onSubmitted,
    );
  }
}
