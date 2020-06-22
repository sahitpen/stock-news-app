extension ListExtensions on List {
  String get shorten {
    return toString()
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll(' ', '');
  }
}
