import 'package:shared_preferences/shared_preferences.dart';

import 'filter_labels.dart';

SharedPreferences sharedPreferences;

Future<Null> initSharedPreferences() async {
  sharedPreferences = await SharedPreferences.getInstance();
}

void saveFilters(Map<String, dynamic> filterStateMap) async {
  for (var label in FilterLabels.boolLabelsExpanded) {
    label = label.toLowerCase();
    await sharedPreferences.setBool(label, filterStateMap[label]);
  }
}

Future<Map<String, dynamic>> getFilters() async {
  final filterOptions = <String, dynamic>{};
  for (var label in FilterLabels.boolLabelsExpanded) {
    label = label.toLowerCase();
    filterOptions[label] = await sharedPreferences.getBool(label);
  }
  return filterOptions;
}
