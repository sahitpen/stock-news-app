import 'package:equatable/equatable.dart';

class News extends Equatable {
  final String newsUrl;
  final String imageUrl;
  final String title;
  final String text;
  final String source;
  final String date;
  final List tickers;

  const News({
    this.newsUrl,
    this.imageUrl,
    this.title,
    this.text,
    this.source,
    this.date,
    this.tickers,
  });

  @override
  List<Object> get props => [
        newsUrl,
        imageUrl,
        title,
        text,
        source,
        date,
        tickers,
      ];

  static News fromJson(dynamic json) {
    return News(
      newsUrl: json['news_url'],
      imageUrl: json['image_url'],
      title: json['title'],
      text: json['text'],
      source: json['source_name'],
      date: json['date'],
      tickers: json['tickers'],
    );
  }
}
