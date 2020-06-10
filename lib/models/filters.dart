import 'package:stock_news/views/chip_filter.dart';
import 'package:stock_news/views/slider_filter.dart';

class Filters {
  static final filterMap = {
    'News Type': ChipFilter.createRow(['Video', 'Audio']),
    'Sentiment': ChipFilter.createRow(['Positive', 'Negative', 'Neutral']),
    'Number of Results': SliderFilter(),
  };
}
