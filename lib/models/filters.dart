import 'package:stock_news/views/chip_filter.dart';

class Filters {
  static final filterMap = {
    'News Type': ChipFilter.createRow(['Video', 'Audio']),
    'Sentiment': ChipFilter.createRow(['Positive', 'Negative', 'Neutral']),
  };
}
