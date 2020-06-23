import 'package:stock_news/models/models.dart';
import 'package:stock_news/repositories/repositories.dart';
import 'package:meta/meta.dart';

class NewsRepository {
  final NewsApiClient _newsApiClient;

  const NewsRepository({@required NewsApiClient newsApiClient})
      : assert(newsApiClient != null),
        _newsApiClient = newsApiClient;

  Future<List<News>> getNews(
      List<String> tickers, Map<String, dynamic> filters) async {
    await _newsApiClient.authenticate();
    _newsApiClient.addFilterParameters(filters);
    final _news = await _newsApiClient.fetchNews(tickers);
    return _news;
  }
}
