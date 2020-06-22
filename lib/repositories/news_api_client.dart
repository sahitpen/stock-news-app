import 'package:dio/dio.dart';
import 'package:stock_news/authorization/secret_loader.dart';
import 'package:stock_news/common/status_code.dart';
import 'package:stock_news/models/news.dart';
import 'package:stock_news/common/extensions.dart';
import 'package:meta/meta.dart';
import 'package:stock_news/repositories/api_client.dart';

class NewsApiClient extends ApiClient {
  NewsApiClient({
    @required Dio httpClient,
  })  : assert(httpClient != null),
        super(
          baseUrl: 'https://stocknewsapi.com/api/v1',
          httpClient: httpClient,
        );

  @override
  Future<bool> authenticate() async {
    queryParameters['token'] = await SecretLoader.getApiKey('news_api_key');
    return true;
  }

  void addFilterParameters(Map<String, dynamic> filters) {
    queryParameters.addAll(_convertFiltersToQueries(filters));
  }

  Future<List<News>> fetchNews(List<String> tickers) async {
    queryParameters['tickers'] = tickers.toString();
    final _newsResponse = await httpClient.get(
      baseUrl,
      queryParameters: queryParameters,
    );

    if (toStatusCode(_newsResponse.statusCode) != StatusCode.OK) {
      throw Exception('Error getting stock news!');
    }

    final _newsList = _newsResponse.data['data'] as List;
    return _newsList.map((newsObj) {
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
    return _queries.shorten;
  }
}
