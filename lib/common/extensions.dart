extension ListExtensions on List {
  String get shorten {
    return toString()
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll(' ', '');
  }
}

extension StringExtension on String {
  String get simplifiedDate {
    final components = split(' ');
    if (components.length < 3) {
      return this;
    }
    return components.sublist(0, 3).join(' ');
  }
}
