import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:stock_news/authorization/secret_loader.dart';
import 'package:stock_news/repositories/api_client.dart';

class PricingApiClient extends ApiClient {
  PricingApiClient({
    @required Dio httpClient,
  })  : assert(httpClient != null),
        super(
          baseUrl:
              'https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY',
          httpClient: httpClient,
        );

  @override
  Future<bool> authenticate() async {
    queryParameters['apikey'] = await SecretLoader.getApiKey('pricing_api_key');
    return true;
  }
}
