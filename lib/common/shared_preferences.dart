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
  await sharedPreferences.setDouble(
      'num_results', filterStateMap['num_results']);
}

Map<String, dynamic> getFilters() {
  final filterOptions = <String, dynamic>{};
  for (var label in FilterLabels.boolLabelsExpanded) {
    label = label.toLowerCase();
    filterOptions[label] = sharedPreferences.getBool(label) ?? false;
  }
  filterOptions['num_results'] =
      sharedPreferences.getDouble('num_results') ?? 0.0;
  return filterOptions;
}
