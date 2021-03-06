import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:stock_news/authorization/secret_loader.dart';
import 'package:stock_news/common/common.dart';
import 'package:stock_news/models/models.dart';
import 'package:stock_news/repositories/repositories.dart';

class PricingApiClient extends ApiClient {
  PricingApiClient({
    @required Dio httpClient,
  })  : assert(httpClient != null),
        super(
          baseUrl:
              'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&outputsize=full',
          httpClient: httpClient,
        );

  @override
  Future<bool> authenticate() async {
    queryParameters['apikey'] = await SecretLoader.getApiKey('pricing_api_key');
    return true;
  }

  Future<List<Price>> fetchPrices(String ticker) async {
    queryParameters['interval'] = '5min';
    queryParameters['symbol'] = ticker;
    final _priceResponse = await httpClient.get(
      baseUrl,
      queryParameters: queryParameters,
    );
    if (toStatusCode(_priceResponse.statusCode) != StatusCode.OK) {
      throw Exception('Error getting price news!');
    }
    final _priceMap =
        _priceResponse.data['Time Series (Daily)'] as Map<String, dynamic>;
    final _priceList = _priceMap.keys
        .map((String date) => Price.fromJson(date, _priceMap[date]))
        .toList();
    return _priceList;
  }
}
