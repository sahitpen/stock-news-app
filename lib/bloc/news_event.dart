part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  bool get stringify => true;
}

class FetchNews extends NewsEvent {
  final List<String> tickers;
  final Map<String, dynamic> filters;

  const FetchNews({
    @required this.tickers,
    @required this.filters,
  }) : assert(
          tickers != null,
          filters != null,
        );

  @override
  List<Object> get props => [
        tickers,
        filters,
      ];
}
