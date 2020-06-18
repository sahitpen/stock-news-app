part of 'pricing_bloc.dart';

abstract class PricingState extends Equatable {
  const PricingState();
  @override
  List<Object> get props => [];
}

class PricesEmpty extends PricingState {}

class PricesError extends PricingState {}

class PricesLoading extends PricingState {}

class PricesLoaded extends PricingState {
  final List<Price> prices;

  const PricesLoaded({
    @required this.prices,
  }) : assert(prices != null);

  @override
  List<Object> get props => [prices];
}
