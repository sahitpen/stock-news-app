import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_news/bloc/news_bloc.dart';
import 'package:stock_news/common/app_text.dart';
import 'package:stock_news/views/list_scaffold.dart';
import 'package:stock_news/views/stock_search_field.dart';
import 'package:stock_news/views/stock_news_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsBloc = BlocProvider.of<NewsBloc>(context);
    final controller = TextEditingController();
    return ListScaffold(
      icon: Icon(Icons.language),
      widgets: <Widget>[
        Text(
          'Hey, Sahit.',
          style: AppText.headerLarge,
        ),
        Text(
          'Market Daily Digest.',
          style: AppText.appBarLarge,
        ),
        SizedBox(height: 16.0),
        StockSearchField(
          key: ValueKey('stock_search_field'),
          controller: controller,
          onSubmitted: (String value) => newsBloc.add(
            FetchNews(tickers: value.split(', ')),
          ),
        ),
        SizedBox(height: 8.0),
        Expanded(
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) => _handleState(state),
          ),
        ),
      ],
    );
  }

  Widget _handleState(NewsState state) {
    if (state is NewsEmpty) {
      return Center(child: Text('There is no news available.'));
    } else if (state is NewsLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (state is NewsLoaded) {
      final news = state.news;
      return ListView.builder(
        key: ValueKey('stock_list'),
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
          return StockNewsCard(news: news[index]);
        },
      );
    } else {
      return Center(child: Text('Could not retrieve news.'));
    }
  }
}
