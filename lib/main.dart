import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_news/common/shared_preferences.dart';
import 'package:stock_news/repositories/news_api_client.dart';

import 'bloc/news_bloc.dart';
import 'common/app_theme.dart';
import 'repositories/news_api_client.dart';
import 'screens/home_page.dart';

// organize file structure by feature rather than by functions
// inside feature director, put bloc folder
// use barrel files
// single param assertions -- see if multiple asserts work
// remove print statements or put them in debug mode if statements
// take a look at logging packages
// XX override stringify in bloc equatable classes
// find pedantic rule for constantws
// add constructor in app padding that takes in int factor that multiplies by default val
// create wrapper resource class that makes the bloc more dumb
// XX keep packages in pubspec in alphabetical order
// XX create enums for status codes
// use SafeArea widget
// XX preface setState with underscore in stateful builder
// make all state class variables private
// make class variables private when needed like in SliderFilter class
// encapsulate widgets in build() function into private classes in same file
// XX make theme variables local to build method
// XX use Dart extensions for methods like simplifyDateString()
// handle all state using Flutter Bloc

// Challenge
// infinite scrolling feature
// Article idea - pick one thing in app that is interesting (chips, graph packages, )

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
