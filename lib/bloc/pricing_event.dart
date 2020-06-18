part of 'pricing_bloc.dart';

abstract class PricingEvent extends Equatable {
  const PricingEvent();
}

class FetchPrices extends PricingEvent {
  final String ticker;

  const FetchPrices({
    @required this.ticker,
  }) : assert(ticker != null);

  @override
  List<Object> get props => [ticker];
}
