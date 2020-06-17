import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_news/common/shared_preferences.dart';
import 'package:stock_news/repositories/news_api_client.dart';

import 'bloc/news_bloc.dart';
import 'common/app_theme.dart';
import 'repositories/news_api_client.dart';
import 'screens/home_page.dart';

void main() {
  runApp(StockNewsApp());
  initSharedPreferences();
}

class StockNewsApp extends StatelessWidget {
  const StockNewsApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      theme: AppTheme.theme,
      home: BlocProvider(
        create: (context) => NewsBloc(
          apiClient: NewsApiClient(
            httpClient: Dio(),
          ),
        ),
        child: HomePage(),
      ),
    );
  }
}
