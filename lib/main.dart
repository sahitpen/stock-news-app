import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/news_bloc.dart';
import 'common/app_theme.dart';
import 'repositories/stock_api_client.dart';
import 'screens/home_page.dart';

void main() {
  runApp(StockNewsApp());
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
          apiClient: StockApiClient(
            httpClient: Dio(),
          ),
        ),
        child: HomePage(),
      ),
    );
  }
}
