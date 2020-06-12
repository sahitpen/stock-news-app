class FilterLabels {
  static final boolLabels = {
    'News Type': ['Video', 'Article'],
    'Sentiment': ['Positive', 'Negative', 'Neutral'],
  };
  static final boolLabelsExpanded = boolLabels.values.expand((x) => x).toList();
}
