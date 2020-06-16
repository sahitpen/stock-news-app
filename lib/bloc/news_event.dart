part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class FetchNews extends NewsEvent {
  final List<String> tickers;
  final Map<String, dynamic> filters;

  FetchNews({
    @required this.tickers,
    @required this.filters,
  }) : assert(
          tickers != null,
          filters != null,
        );

  @override
  List<Object> get props => [
        tickers,
        filters,
      ];

  Map<String, dynamic> get filterQueries => _convertFiltersToQueries();

  Map<String, dynamic> _convertFiltersToQueries() {
    final _queries = <String, dynamic>{};
    // Convert news type checkboxes to queries
    _queries['type'] = _elementsToQuery(['video', 'article']);
    // Convert sentiment checkboxes to queries
    _queries['sentiment'] =
        _elementsToQuery(['positive', 'negative', 'neutral']);
    // Convert slider to query
    _queries['items'] = filters['num_results'].toInt();
    print(_queries);
    return _queries;
  }

  String _elementsToQuery(List<String> items) {
    final _queries = [];
    for (final item in items) {
      if (filters[item]) {
        _queries.add(item);
      }
    }
    if (_queries.isEmpty) {
      _queries.addAll(items);
    }
    return _shortenList(_queries);
  }

  String _shortenList(List list) {
    return list
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll(' ', '');
  }
}
