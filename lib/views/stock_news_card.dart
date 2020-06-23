import 'package:flutter/material.dart';
import 'package:stock_news/common/common.dart';
import 'package:stock_news/models/models.dart';
import 'package:url_launcher/url_launcher.dart';

class StockNewsCard extends StatelessWidget {
  final News _news;

  const StockNewsCard({
    Key key,
    @required News news,
  })  : assert(news != null),
        _news = news,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.padding16Top,
      child: InkWell(
        onTap: () => _openArticle(_news.newsUrl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${_news.source}',
                  style: AppText.subtitleDark,
                ),
                Text(
                  _news.date.simplifiedDate,
                  style: AppText.subtitle,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              '${_news.title}',
              style: AppText.header,
            ),
            const SizedBox(height: 8.0),
            ClipRRect(
              child: Image.network('${_news.imageUrl}'),
              borderRadius: AppBorders.rounded20,
            ),
            const SizedBox(height: 16.0),
            Text(
              _news.tickers.join(', '),
              style: AppText.subtitleAccent,
            ),
            const Divider(height: 30),
          ],
        ),
      ),
    );
  }

  void _openArticle(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw Exception('Could not open article.');
    }
  }
}
