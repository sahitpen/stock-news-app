part of 'pricing_bloc.dart';

abstract class PricingEvent extends Equatable {
  const PricingEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class FetchPrices extends PricingEvent {
  final String ticker;

  const FetchPrices({
    @required this.ticker,
  }) : assert(ticker != null);

  @override
  List<Object> get props => [ticker];
}
