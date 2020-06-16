import 'package:dio/dio.dart';
import 'package:stock_news/authorization/secret_loader.dart';
import 'package:stock_news/models/news.dart';
import 'package:meta/meta.dart';

class StockApiClient {
  static const baseUrl = 'https://stocknewsapi.com/api/v1';
  final Map<String, dynamic> queryParameters = {};
  final Dio httpClient;

  StockApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<bool> authenticate() async {
    final apiKey = await SecretLoader.getStocksApiKey();
    queryParameters['token'] = apiKey;
    return true;
  }

  void addFilterParameters(Map<String, dynamic> filters) {
    queryParameters.addAll(_convertFiltersToQueries(filters));
  }

  Future<List<News>> fetchNews(List<String> tickers) async {
    queryParameters['tickers'] = tickers.toString();
    final newsResponse = await httpClient.get(
      baseUrl,
      queryParameters: queryParameters,
    );

    if (newsResponse.statusCode != 200) {
      throw Exception('Error getting stock news!');
    }

    final newsList = newsResponse.data['data'] as List;
    return newsList.map((newsObj) {
      return News.fromJson(newsObj);
    }).toList();
  }

  Map<String, dynamic> _convertFiltersToQueries(Map<String, dynamic> filters) {
    final _queries = <String, dynamic>{};
    // Convert news type checkboxes to queries
    _queries['type'] = _elementsToQuery(['video', 'article'], filters);
    // Convert sentiment checkboxes to queries
    _queries['sentiment'] =
        _elementsToQuery(['positive', 'negative', 'neutral'], filters);
    // Convert slider to query
    _queries['items'] = filters['num_results'].toInt();
    return _queries;
  }

  String _elementsToQuery(List<String> items, Map<String, dynamic> filters) {
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
