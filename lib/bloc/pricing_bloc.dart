import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stock_news/models/price.dart';
import 'package:stock_news/repositories/pricing_api_client.dart';

part 'pricing_event.dart';
part 'pricing_state.dart';

class PricingBloc extends Bloc<PricingEvent, PricingState> {
  final PricingApiClient apiClient;

  PricingBloc({
    @required this.apiClient,
  }) : assert(apiClient != null);

  @override
  PricingState get initialState => PricesEmpty();

  @override
  Stream<PricingState> mapEventToState(PricingEvent event) async* {
    if (event is FetchPrices) {
      yield PricesLoading();
      try {
        await apiClient.authenticate();
        final prices = await apiClient.fetchPrices(event.ticker);
        print(prices);
        if (prices.isEmpty) {
          yield PricesEmpty();
        } else {
          yield PricesLoaded(prices: prices);
        }
      } catch (error) {
        print(error);
        yield PricesError();
      }
    }
  }
}
