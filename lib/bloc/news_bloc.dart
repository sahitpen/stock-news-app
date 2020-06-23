import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:stock_news/repositories/repositories.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:stock_news/models/models.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsApiClient apiClient;

  NewsBloc({
    @required this.apiClient,
  }) : assert(apiClient != null);

  @override
  NewsState get initialState => NewsEmpty();

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is FetchNews) {
      yield NewsLoading();
      try {
        final newsRepo = NewsRepository(newsApiClient: apiClient);
        final news = await newsRepo.getNews(event.tickers, event.filters);
        if (news.isEmpty) {
          yield NewsEmpty();
        } else {
          yield NewsLoaded(news: news);
        }
      } catch (_) {
        yield NewsError();
      }
    }
  }
}
