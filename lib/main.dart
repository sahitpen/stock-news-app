import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_news/common/common.dart';
import 'package:stock_news/repositories/repositories.dart';

import 'bloc/news_bloc.dart';
import 'screens/home_page.dart';

// organize file structure by feature rather than by functions
// inside feature director, put bloc folder
// can use bloc for filters (event is tapping on chip, states are properties for filters)
// XX use barrel files
// single param assertions -- see if multiple asserts work
// XX remove print statements or put them in debug mode if statements
// XX override stringify in bloc equatable classes
// XX find pedantic rule for constants
// add constructor in app padding that takes in int factor that multiplies by default val
// XX create wrapper resource class that makes the bloc more dumb
// XX keep packages in pubspec in alphabetical order
// XX create enums for status codes
// XX use SafeArea widget
// XX preface setState with underscore in stateful builder
// XX make all state class variables private
// XX make class variables private when needed like in SliderFilter class
// encapsulate widgets in build() function into private classes in same file
// XX make theme variables local to build method
// XX use Dart extensions for methods like simplifyDateString()
// handle all state using Flutter Bloc

// Challenge
// take a look at logging packages
// infinite scrolling feature
// Article idea - pick one thing in app that is interesting (chips, graph packages, )

void main() {
  runApp(const StockNewsApp());
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
        child: const HomePage(),
      ),
    );
  }
}
