import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_news/bloc/news_bloc.dart';
import 'package:stock_news/common/common.dart';
import 'package:stock_news/views/animated_search_field.dart';
import 'package:stock_news/views/header_titles.dart';
import 'package:stock_news/views/list_scaffold.dart';
import 'package:stock_news/views/stock_news_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsBloc = BlocProvider.of<NewsBloc>(context);
    final controller = TextEditingController();
    return Container(
      color: AppTheme.theme.canvasColor,
      child: SafeArea(
        child: ListScaffold(
          icon: Icon(Icons.language),
          header: HeaderTitles(),
          widgets: <Widget>[
            AnimatedSearchField(
              controller: controller,
              onSubmitted: () => newsBloc.add(
                FetchNews(
                  tickers: controller.text.split(', '),
                  filters: getFilters(),
                ),
              ),
            ),
            const SizedBox(height: 4.0),
            Expanded(
              child: BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) => _handleState(state),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _handleState(NewsState state) {
    if (state is NewsEmpty) {
      return const Center(child: Text('There is no news available.'));
    } else if (state is NewsLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is NewsLoaded) {
      final news = state.news;
      return ListView.builder(
        key: const ValueKey('stock_list'),
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) {
          return StockNewsCard(news: news[index]);
        },
      );
    } else {
      return const Center(child: Text('Could not retrieve news.'));
    }
  }
}
