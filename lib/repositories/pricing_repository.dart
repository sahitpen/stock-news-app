import 'package:stock_news/models/models.dart';
import 'package:stock_news/repositories/repositories.dart';
import 'package:meta/meta.dart';

class PricingRepository {
  final PricingApiClient _priceApiClient;

  const PricingRepository({@required PricingApiClient priceApiClient})
      : assert(priceApiClient != null),
        _priceApiClient = priceApiClient;

  Future<List<Price>> getPrices(String ticker) async {
    await _priceApiClient.authenticate();
    final _prices = await _priceApiClient.fetchPrices(ticker);
    return _prices;
  }
}
